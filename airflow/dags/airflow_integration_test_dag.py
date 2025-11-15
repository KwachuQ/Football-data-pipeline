from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python import PythonOperator
import subprocess
import json

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2025, 1, 1),
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
}

def test_basic_import(**context):
    """Test basic Python imports in ETL worker container"""
    command = """docker exec etl_worker python -c "
import sys
print('PYTHONPATH:', sys.path)

from etl.bronze.client import SofascoreClient
from etl.bronze.storage import BronzeStorageManager
print('IMPORT_TEST:SUCCESS')
" """
    
    try:
        result = subprocess.run(command, shell=True, capture_output=True, text=True, timeout=30)
        
        print(f"Return code: {result.returncode}")
        print(f"Stdout:\n{result.stdout}")
        print(f"Stderr:\n{result.stderr}")
        
        if result.returncode != 0:
            raise Exception(f"Import test failed with code {result.returncode}: {result.stderr}")
        
        if 'IMPORT_TEST:SUCCESS' not in result.stdout:
            raise Exception(f"Expected success message not found. Output: {result.stdout}")
        
        print("✅ Import test successful")
        
    except subprocess.TimeoutExpired:
        raise Exception("Command timed out after 30 seconds")

def test_client_initialization(**context):
    """Test SofascoreClient initialization in ETL worker"""
    command = """docker exec etl_worker python -c "
import os
from etl.bronze.client import SofascoreClient

api_key = os.getenv('RAPIDAPI_KEY')
if not api_key:
    raise ValueError('RAPIDAPI_KEY not set')

client = SofascoreClient(api_key=api_key)
print('CLIENT_INIT:SUCCESS')
print(f'Client initialized with key: {api_key[:6]}...')
" """
    
    try:
        result = subprocess.run(command, shell=True, capture_output=True, text=True, timeout=30)
        
        print(f"Return code: {result.returncode}")
        print(f"Output:\n{result.stdout}")
        
        if result.returncode != 0:
            raise Exception(f"Client init failed: {result.stderr}")
        
        if 'CLIENT_INIT:SUCCESS' not in result.stdout:
            raise Exception(f"Expected success message not found: {result.stdout}")
        
        print("✅ Client initialization successful")
        
    except subprocess.TimeoutExpired:
        raise Exception("Command timed out")

def test_storage_manager(**context):
    """Test BronzeStorageManager in ETL worker"""
    command = """docker exec etl_worker python -c "
import os
from minio import Minio
from etl.bronze.storage import BronzeStorageManager
import json

# Create MinIO client
minio_client = Minio(
    os.getenv('MINIO_ENDPOINT', 'minio:9000'),
    access_key=os.getenv('MINIO_ACCESS_KEY', 'minio'),
    secret_key=os.getenv('MINIO_SECRET_KEY', 'minio123'),
    secure=False
)

# Create storage manager
storage = BronzeStorageManager(minio_client=minio_client, bucket_name='bronze')

# Verify storage manager was created
print(f'✓ BronzeStorageManager created')
print(f'✓ Bucket name: {storage.bucket_name}')
print(f'✓ Schema version: {storage.SCHEMA_VERSION}')

# Test partition key generation
partition_key = storage.generate_partition_key(
    tournament_id=202,
    season_id=76477,
    match_date='2025-11-13'
)
print(f'✓ Partition key generated: {partition_key}')

# List buckets via the MinIO client
buckets = [b.name for b in minio_client.list_buckets()]
print(f'✓ Available buckets: {buckets}')

print('STORAGE_TEST:SUCCESS')
" """
    
    try:
        result = subprocess.run(command, shell=True, capture_output=True, text=True, timeout=30)
        
        print(f"Output:\n{result.stdout}")
        
        if result.returncode != 0:
            raise Exception(f"Storage test failed: {result.stderr}")
        
        if 'STORAGE_TEST:SUCCESS' not in result.stdout:
            raise Exception(f"Expected success message not found")
        
        print("✅ Storage manager test successful")
        
    except subprocess.TimeoutExpired:
        raise Exception("Command timed out")

def test_postgres_connection(**context):
    """Test PostgreSQL connection from ETL worker"""
    command = """docker exec etl_worker python -c "
import os
import psycopg2

try:
    # Connect with explicit parameters
    conn = psycopg2.connect(
        host=os.getenv('POSTGRES_HOST', 'postgres'),
        port=int(os.getenv('POSTGRES_PORT', '5432')),
        database=os.getenv('POSTGRES_DB', 'dwh'),
        user=os.getenv('POSTGRES_USER', 'airflow'),
        password=os.getenv('POSTGRES_PASSWORD', 'airflow'),
        connect_timeout=10
    )
    
    print(f'✓ Connected to PostgreSQL')
    
    cur = conn.cursor()
    
    # Test 1: Basic connection
    cur.execute('SELECT version();')
    version = cur.fetchone()[0]
    print(f'✓ PostgreSQL version: {version[:50]}...')
    
    # Test 2: Check schemas
    cur.execute(\\\"\\\"\\\"
        SELECT schema_name 
        FROM information_schema.schemata 
        WHERE schema_name IN ('bronze', 'silver', 'gold')
        ORDER BY schema_name;
    \\\"\\\"\\\")
    schemas = [row[0] for row in cur.fetchall()]
    print(f'✓ Available schemas: {schemas}')
    
    # Test 3: Check if bronze.full_matches_data exists
    cur.execute(\\\"\\\"\\\"
        SELECT EXISTS (
            SELECT FROM information_schema.tables 
            WHERE table_schema = 'bronze' 
            AND table_name = 'full_matches_data'
        );
    \\\"\\\"\\\")
    table_exists = cur.fetchone()[0]
    
    if table_exists:
        cur.execute('SELECT COUNT(*) FROM bronze.full_matches_data;')
        count = cur.fetchone()[0]
        print(f'✓ bronze.full_matches_data exists: {count:,} records')
    else:
        print(f'⚠ bronze.full_matches_data does not exist yet (expected for fresh install)')
    
    # Test 4: Check if bronze.raw_matches exists
    cur.execute(\\\"\\\"\\\"
        SELECT EXISTS (
            SELECT FROM information_schema.tables 
            WHERE table_schema = 'bronze' 
            AND table_name = 'raw_matches'
        );
    \\\"\\\"\\\")
    raw_table_exists = cur.fetchone()[0]
    
    if raw_table_exists:
        cur.execute('SELECT COUNT(*) FROM bronze.raw_matches;')
        raw_count = cur.fetchone()[0]
        print(f'✓ bronze.raw_matches exists: {raw_count:,} records')
    else:
        print(f'⚠ bronze.raw_matches does not exist yet')
    
    conn.close()
    print('POSTGRES_TEST:SUCCESS')
    
except psycopg2.OperationalError as e:
    print(f'✗ Connection failed: {e}')
    raise
except Exception as e:
    print(f'✗ Test failed: {e}')
    raise
" """
    
    try:
        result = subprocess.run(command, shell=True, capture_output=True, text=True, timeout=30)
        
        print(f"Output:\n{result.stdout}")
        
        if result.returncode != 0:
            print(f"Error:\n{result.stderr}")
            raise Exception(f"PostgreSQL test failed: {result.stderr}")
        
        if 'POSTGRES_TEST:SUCCESS' not in result.stdout:
            raise Exception(f"Expected success message not found")
        
        print("✅ PostgreSQL connection successful")
        
    except subprocess.TimeoutExpired:
        raise Exception("Command timed out")

def test_minio_connection(**context):
    """Test MinIO connection from ETL worker"""
    command = """docker exec etl_worker python -c "
import os
from minio import Minio

client = Minio(
    os.getenv('MINIO_ENDPOINT', 'minio:9000'),
    access_key=os.getenv('MINIO_ACCESS_KEY', 'minio'),
    secret_key=os.getenv('MINIO_SECRET_KEY', 'minio123'),
    secure=False
)

buckets = [bucket.name for bucket in client.list_buckets()]
print(f'MINIO_TEST:SUCCESS')
print(f'Buckets: {buckets}')
" """
    
    try:
        result = subprocess.run(command, shell=True, capture_output=True, text=True, timeout=30)
        
        print(f"Output:\n{result.stdout}")
        
        if result.returncode != 0:
            raise Exception(f"MinIO test failed: {result.stderr}")
        
        if 'MINIO_TEST:SUCCESS' not in result.stdout:
            raise Exception(f"Expected success message not found")
        
        print("✅ MinIO connection successful")
        
    except subprocess.TimeoutExpired:
        raise Exception("Command timed out")

with DAG(
    'test_etl_worker_integration',
    default_args=default_args,
    description='Test ETL worker integration with Airflow',
    schedule=None,
    catchup=False,
    tags=['test', 'etl', 'integration']
) as dag:
    
    test_imports = PythonOperator(
        task_id='test_imports',
        python_callable=test_basic_import
    )
    
    test_client = PythonOperator(
        task_id='test_client',
        python_callable=test_client_initialization
    )
    
    test_storage = PythonOperator(
        task_id='test_storage',
        python_callable=test_storage_manager
    )
    
    test_postgres = PythonOperator(
        task_id='test_postgres',
        python_callable=test_postgres_connection
    )
    
    test_minio = PythonOperator(
        task_id='test_minio',
        python_callable=test_minio_connection
    )
    
    # Test sequence
    test_imports >> test_client >> test_storage >> [test_postgres, test_minio]