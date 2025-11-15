"""
TEST DAG for 01_bronze_extract_incremental_matches
Uses test-specific MinIO bucket and separate data to avoid production interference
"""
from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.providers.postgres.hooks.postgres import PostgresHook
import subprocess
import json

TOURNAMENT_ID = 202  # Ekstraklasa
TEST_BUCKET = 'bronze-test'  # Separate test bucket

def setup_test_bucket(**context):
    """Create test bucket if it doesn't exist"""
    print("🧪 Setting up test bucket...")
    
    command = """docker exec etl_worker python -c "
from etl.bronze.client import get_minio_client

minio_client = get_minio_client()

# Create test bucket if it doesn't exist
bucket_name = 'bronze-test'
if not minio_client.bucket_exists(bucket_name):
    minio_client.make_bucket(bucket_name)
    print(f'✅ Created test bucket: {bucket_name}')
else:
    print(f'✅ Test bucket already exists: {bucket_name}')
" """
    
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    print(result.stdout)
    if result.returncode != 0:
        print(f"⚠️ Error: {result.stderr}")
        raise Exception("Failed to setup test bucket")
    
    return {'bucket': TEST_BUCKET}

def get_last_match_info(**context) -> dict:
    """Get last match date and season_id from PostgreSQL"""
    hook = PostgresHook(postgres_conn_id='postgres_default')
    
    query = """
        SELECT 
            start_timestamp::date as match_date,
            season_id,
            season_name,
            start_timestamp
        FROM bronze.full_matches_data
        WHERE unique_tournament_id = 202
        ORDER BY start_timestamp DESC
        LIMIT 1
    """
    
    result = hook.get_first(query)
    
    if result and result[0]:
        info = {
            'last_date': str(result[0]),
            'season_id': result[1],
            'season_name': result[2] if result[2] else '25/26',
            'last_timestamp': str(result[3]),
            'tournament_id': TOURNAMENT_ID
        }
        print(f"✅ Found last match:")
        print(f"   📅 Date: {info['last_date']}")
        print(f"   🏆 Tournament ID: {info['tournament_id']}")
        print(f"   ⚽ Season ID: {info['season_id']}")
        print(f"   📋 Season Name: {info['season_name']}")
    else:
        raise ValueError(
            "❌ No data in bronze.full_matches_data for tournament_id=202. "
            "Run historical load first."
        )
    
    return info

def test_extract_new_matches(**context) -> dict:
    """TEST: Extract matches but save to test bucket"""
    ti = context['ti']
    info = ti.xcom_pull(task_ids='get_last_info')
    
    last_date = info['last_date']
    season_id = info['season_id']
    
    print(f"🧪 TEST MODE: Extracting new matches (will save to {TEST_BUCKET})")
    print(f"🔍 Searching for matches after: {last_date}")
    print(f"🔍 Season ID: {season_id}, Tournament ID: {TOURNAMENT_ID}")
    
    # Modified command to use test bucket
    command = f"""docker exec etl_worker python -c "
import asyncio
import json
import os

# Override bucket name for testing
os.environ['BRONZE_BUCKET_NAME'] = '{TEST_BUCKET}'

from etl.bronze.extractors.incremental_extractor import SofascoreIncrementalETL

async def run():
    async with SofascoreIncrementalETL() as etl:
        # Override storage bucket
        etl.storage.bucket_name = '{TEST_BUCKET}'
        
        result = await etl.extract_new_matches(
            tournament_id={TOURNAMENT_ID},
            season_id={season_id},
            last_match_date='{last_date}',
            max_pages=25
        )
    print('RESULT:' + json.dumps({{
        'new': result['total_new_matches'],
        'saved': len(result['stored_batches']),
        'pages': result['pages_scanned'],
        'errors': len(result['errors'])
    }}))

asyncio.run(run())
" """
    
    try:
        result = subprocess.run(command, shell=True, capture_output=True, text=True, timeout=600)
        
        if result.returncode != 0:
            print(f"⚠️ Execution error: {result.stderr}")
            print(f"📋 stdout: {result.stdout}")
            return {'new': 0, 'saved': 0}
        
        print(f"📋 Output:\n{result.stdout}")
        
        for line in result.stdout.split('\n'):
            if line.startswith('RESULT:'):
                matches_result = json.loads(line.replace('RESULT:', ''))
                print(f"✅ TEST RESULTS:")
                print(f"  • New matches: {matches_result['new']}")
                print(f"  • Saved batches: {matches_result['saved']}")
                print(f"  • Pages scanned: {matches_result['pages']}")
                print(f"  • Errors: {matches_result['errors']}")
                print(f"  • Bucket used: {TEST_BUCKET}")
                return matches_result
        
        print("⚠️ No RESULT: in output")
        return {'new': 0, 'saved': 0}
        
    except subprocess.TimeoutExpired:
        print(f"⚠️ Timeout - process took longer than 10 minutes")
        return {'new': 0, 'saved': 0}
    except Exception as e:
        print(f"⚠️ Error: {type(e).__name__}: {e}")
        return {'new': 0, 'saved': 0}

def verify_test_data(**context):
    """Verify data was written to test bucket"""
    print("🔍 Verifying test data in test bucket...")
    
    command = f"""docker exec etl_worker python -c "
from etl.bronze.client import get_minio_client

minio_client = get_minio_client()

# List objects in test bucket
objects = list(minio_client.list_objects('{TEST_BUCKET}', recursive=True))

print(f'Found {{len(objects)}} objects in {TEST_BUCKET}')

if objects:
    print('Sample files:')
    for i, obj in enumerate(objects[:10]):
        print(f'  {{i+1}}. {{obj.object_name}} ({{obj.size}} bytes)')
    
    print(f'✅ Test data verified in {TEST_BUCKET}')
else:
    print(f'⚠️ No data found in {TEST_BUCKET}')
" """
    
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    print(result.stdout)
    if result.returncode != 0:
        print(f"⚠️ Error: {result.stderr}")

def cleanup_test_data(**context):
    """Optional: Clean up test bucket after verification"""
    print("🧹 Cleaning up test data...")
    
    command = f"""docker exec etl_worker python -c "
from etl.bronze.client import get_minio_client

minio_client = get_minio_client()

# Remove all objects from test bucket
objects = list(minio_client.list_objects('{TEST_BUCKET}', recursive=True))
for obj in objects:
    minio_client.remove_object('{TEST_BUCKET}', obj.object_name)
    
print(f'🧹 Removed {{len(objects)}} objects from {TEST_BUCKET}')
" """
    
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    print(result.stdout)

# DAG
with DAG(
    'test_01_bronze_extract_incremental',
    default_args={
        'owner': 'airflow',
        'retries': 0,  # No retries for testing
    },
    description='[TEST] Test incremental extraction without affecting production data',
    schedule=None,  # Manual trigger only
    start_date=datetime(2024, 1, 1),
    catchup=False,
    tags=['test', 'ekstraklasa', 'incremental', 'bronze']
) as dag:
    
    setup_test = PythonOperator(
        task_id='setup_test_bucket',
        python_callable=setup_test_bucket
    )
    
    get_last_info = PythonOperator(
        task_id='get_last_info',
        python_callable=get_last_match_info
    )
    
    test_extract = PythonOperator(
        task_id='test_extract_matches',
        python_callable=test_extract_new_matches,
        execution_timeout=timedelta(minutes=15)
    )
    
    verify = PythonOperator(
        task_id='verify_test_data',
        python_callable=verify_test_data
    )
    
    cleanup = PythonOperator(
        task_id='cleanup_test_data',
        python_callable=cleanup_test_data,
        trigger_rule='all_done'  # Run even if previous tasks fail
    )
    
    # Task dependencies
    setup_test >> get_last_info >> test_extract >> verify >> cleanup
