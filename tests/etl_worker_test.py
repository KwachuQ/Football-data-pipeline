#!/usr/bin/env python3
"""
Test ETL Worker Integration with Airflow
"""

import subprocess
import json
import sys
from pathlib import Path
from typing import Dict, List, Tuple, Callable

# Test configuration
CONTAINER_NAME = "etl_worker"
ENV_FILE_PATH = Path(__file__).parent.parent / 'docker' / '.env'

REQUIRED_CONTAINER_VARS = {
    'RAPIDAPI_KEY', 'RAPIDAPI_HOST', 'MINIO_ENDPOINT', 'MINIO_ACCESS_KEY',
    'MINIO_SECRET_KEY', 'MINIO_SECURE', 'POSTGRES_HOST', 'POSTGRES_PORT',
    'POSTGRES_DB', 'POSTGRES_USER', 'POSTGRES_PASSWORD', 'PYTHONPATH'
}

SENSITIVE_KEYWORDS = {'KEY', 'PASSWORD', 'SECRET'}

def load_env_file() -> Dict[str, str]:
    """Load environment variables from docker/.env"""
    if not ENV_FILE_PATH.exists():
        print(f"⚠️  Warning: No .env found at {ENV_FILE_PATH}")
        return {}
    
    env_vars = {}
    with open(ENV_FILE_PATH, 'r') as f:
        for line in f:
            line = line.strip()
            if line and not line.startswith('#') and '=' in line:
                key, value = line.split('=', 1)
                env_vars[key.strip()] = value.strip().strip('"\'')
    
    print(f"📋 Loaded {len(env_vars)} variables from {ENV_FILE_PATH.name}")
    return env_vars

def exec_in_container(command: str, timeout: int = 30) -> Tuple[int, str, str]:
    """Execute command in container and return (returncode, stdout, stderr)"""
    # Use list form to avoid shell escaping issues
    result = subprocess.run(
        ['docker', 'exec', CONTAINER_NAME, 'python', '-c', command],
        capture_output=True,
        text=True,
        timeout=timeout
    )
    return result.returncode, result.stdout.strip(), result.stderr.strip()

def mask_sensitive(var_name: str, value: str) -> str:
    """Mask sensitive values in output"""
    if any(keyword in var_name for keyword in SENSITIVE_KEYWORDS):
        return value[:4] + "***"
    return value

def print_test_header(test_num: int, test_name: str):
    """Print formatted test header"""
    print(f"\n🧪 Test {test_num}: {test_name}")

def print_result(success: bool, message: str, details: str = ""):
    """Print test result with optional details"""
    status = "✅" if success else "❌"
    print(f"{status} {message}")
    if details:
        for line in details.split('\n'):
            print(f"   {line}")

# Test functions
def test_container_running() -> bool:
    """Test if ETL worker container is running"""
    print_test_header(1, "Container Status")
    result = subprocess.run(
        ["docker", "ps", "--filter", f"name={CONTAINER_NAME}", "--format", "{{.Names}}"],
        capture_output=True, text=True
    )
    success = CONTAINER_NAME in result.stdout
    print_result(success, f"{CONTAINER_NAME} container is running")
    return success

def test_python_imports() -> bool:
    """Test if Python packages are importable"""
    print_test_header(2, "Python Package Imports")
    
    imports = [
        "psycopg2", "minio", "pandas",
        "etl.bronze.client.SofascoreClient",
        "etl.bronze.storage.BronzeStorageManager"
    ]
    
    for import_path in imports:
        module_parts = import_path.rsplit('.', 1)
        if len(module_parts) == 2:
            cmd = f"from {module_parts[0]} import {module_parts[1]}; print('OK')"
        else:
            cmd = f"import {import_path}; print('OK')"
        
        code, stdout, stderr = exec_in_container(cmd)
        success = code == 0 and 'OK' in stdout
        
        if not success:
            print_result(False, f"import {import_path}", stderr)
            return False
        print_result(True, f"import {import_path}")
    
    return True

def test_environment_variables(env_vars: Dict[str, str]) -> bool:
    """Test if environment variables are set in container"""
    print_test_header(3, "Environment Variables")
    
    all_passed = True
    for var in sorted(REQUIRED_CONTAINER_VARS):
        cmd = f"import os; print(os.getenv('{var}', 'NOT_SET'))"
        code, value, _ = exec_in_container(cmd)
        
        if value and value != "NOT_SET":
            display = mask_sensitive(var, value)
            print_result(True, f"{var}={display}")
        else:
            print_result(False, f"{var} is NOT SET")
            all_passed = False
    
    return all_passed

def test_service_connection(test_num: int, service_name: str, 
                           test_code: str, success_marker: str) -> bool:
    """Generic service connection test"""
    print_test_header(test_num, f"{service_name} Connection")
    
    code, stdout, stderr = exec_in_container(test_code)
    success = code == 0 and success_marker in stdout
    
    if success:
        print_result(True, f"{service_name} connection successful")
        # Print additional output if available
        extra_output = stdout.replace(success_marker, '').strip()
        if extra_output:
            print(f"   {extra_output}")
    else:
        details = f"stdout: {stdout}\nstderr: {stderr}" if stderr else f"stdout: {stdout}"
        print_result(False, f"{service_name} connection failed", details)
    
    return success

def test_minio_connection() -> bool:
    """Test MinIO connection"""
    code = """import os
from minio import Minio

client = Minio(
    os.getenv('MINIO_ENDPOINT', 'minio:9000'),
    access_key=os.getenv('MINIO_ACCESS_KEY', 'minio'),
    secret_key=os.getenv('MINIO_SECRET_KEY', 'minio123'),
    secure=False
)
buckets = [b.name for b in client.list_buckets()]
print('MINIO:OK')
print(f'Buckets: {buckets}')
"""
    return test_service_connection(4, "MinIO", code, "MINIO:OK")

def test_postgres_connection() -> bool:
    """Test PostgreSQL connection"""
    code = """import os
import psycopg2

conn = psycopg2.connect(
    host=os.getenv('POSTGRES_HOST', 'postgres'),
    port=int(os.getenv('POSTGRES_PORT', '5432')),
    database=os.getenv('POSTGRES_DB', 'dwh'),
    user=os.getenv('POSTGRES_USER', 'airflow'),
    password=os.getenv('POSTGRES_PASSWORD', 'airflow'),
    connect_timeout=10
)
conn.cursor().execute('SELECT version()')
conn.close()
print('POSTGRES:OK')
"""
    return test_service_connection(5, "PostgreSQL", code, "POSTGRES:OK")

def test_etl_code_structure() -> bool:
    """Test ETL code structure"""
    print_test_header(6, "ETL Code Structure")
    
    paths = {
        'bronze_client': '/opt/etl/bronze/client.py',
        'bronze_storage': '/opt/etl/bronze/storage.py',
        'bronze_init': '/opt/etl/bronze/__init__.py',
        'extractors': '/opt/etl/bronze/extractors',
        'diagnostics': '/opt/etl/bronze/diagnostics',
        'utils': '/opt/etl/utils'
    }
    
    check_code = f"""import os
import json

paths = {{
    {', '.join(f"'{k}': os.path.exists('{v}')" for k, v in paths.items())}
}}
print('STRUCTURE:' + json.dumps(paths))
"""
    
    code, stdout, stderr = exec_in_container(check_code)
    
    if code == 0 and 'STRUCTURE:' in stdout:
        structure = json.loads(stdout.split('STRUCTURE:')[1])
        all_exist = all(structure.values())
        
        for name, exists in structure.items():
            print_result(exists, name)
        
        return all_exist
    else:
        print_result(False, "Structure check failed", f"stderr: {stderr}")
        return False

def test_sofascore_client() -> bool:
    """Test SofascoreClient initialization"""
    code = """import os
from etl.bronze.client import SofascoreClient

api_key = os.getenv('RAPIDAPI_KEY')
if not api_key:
    raise ValueError('RAPIDAPI_KEY not set')

client = SofascoreClient(api_key=api_key)
print('CLIENT:OK')
"""
    return test_service_connection(7, "SofascoreClient", code, "CLIENT:OK")

def main():
    """Run all tests"""
    print("=" * 60)
    print("ETL WORKER INTEGRATION TESTS")
    print("=" * 60)
    
    env_vars = load_env_file()
    
    tests: List[Tuple[str, Callable[[], bool]]] = [
        ("Container Running", test_container_running),
        ("Python Imports", test_python_imports),
        ("Environment Variables", lambda: test_environment_variables(env_vars)),
        ("MinIO Connection", test_minio_connection),
        ("PostgreSQL Connection", test_postgres_connection),
        ("ETL Code Structure", test_etl_code_structure),
        ("SofascoreClient", test_sofascore_client)
    ]
    
    results = []
    for test_name, test_func in tests:
        try:
            results.append((test_name, test_func()))
        except Exception as e:
            print(f"❌ Test failed with exception: {e}")
            import traceback
            traceback.print_exc()
            results.append((test_name, False))
    
    # Summary
    print("\n" + "=" * 60)
    print("TEST SUMMARY")
    print("=" * 60)
    
    passed = sum(1 for _, result in results if result)
    total = len(results)
    
    for test_name, result in results:
        status = "✅ PASS" if result else "❌ FAIL"
        print(f"{status} - {test_name}")
    
    print(f"\nTotal: {passed}/{total} tests passed")
    
    if passed == total:
        print("\n🎉 All tests passed! ETL worker is ready.")
    else:
        print(f"\n⚠️  {total - passed} test(s) failed.")
    
    return 0 if passed == total else 1

if __name__ == "__main__":
    sys.exit(main())