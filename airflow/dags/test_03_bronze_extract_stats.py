"""
TEST DAG for 03_bronze_extract_incremental_stats
Uses test-specific MinIO bucket and test match IDs
"""
from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.providers.postgres.hooks.postgres import PostgresHook
from airflow.exceptions import AirflowFailException
import subprocess
import json
import os

TOURNAMENT_ID = 202  # Ekstraklasa
TEST_BUCKET = 'bronze-test'

def setup_test_bucket(**context):
    """Create test bucket if it doesn't exist"""
    print("🧪 Setting up test bucket...")
    
    command = """docker exec etl_worker python -c "
from etl.bronze.client import get_minio_client

minio_client = get_minio_client()

bucket_name = 'bronze-test'
if not minio_client.bucket_exists(bucket_name):
    minio_client.make_bucket(bucket_name)
    print(f'✅ Created test bucket: {bucket_name}')
else:
    print(f'✅ Test bucket already exists: {bucket_name}')
" """
    
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    print(result.stdout)

def get_test_match_ids(**context):
    """Get a small sample of match IDs for testing (5-10 matches)"""
    print("🔍 Getting test match IDs...")
    
    hook = PostgresHook(postgres_conn_id='postgres_default')
    
    # Get recent matches that might not have stats yet
    query = f"""
        SELECT match_id
        FROM bronze.full_matches_data
        WHERE unique_tournament_id = {TOURNAMENT_ID}
        AND status_type = 'finished'
        ORDER BY start_timestamp DESC
        LIMIT 5
    """
    
    results = hook.get_records(query)
    
    if not results:
        print("ℹ️ No matches found for testing")
        return {'match_ids': [], 'count': 0}
    
    match_ids = [row[0] for row in results]
    
    print(f"✅ Selected {len(match_ids)} matches for testing:")
    for i, mid in enumerate(match_ids, 1):
        print(f"  {i}. match_id={mid}")
    
    return {'match_ids': match_ids, 'count': len(match_ids)}

def test_fetch_statistics(**context):
    """TEST: Fetch statistics and save to test bucket"""
    ti = context['ti']
    test_data = ti.xcom_pull(task_ids='get_test_matches')
    
    if test_data['count'] == 0:
        print("ℹ️ No matches to test")
        return {'fetched': 0, 'failed': 0, 'skipped': 0}
    
    match_ids = test_data['match_ids']
    
    print(f"🧪 TEST MODE: Fetching statistics for {len(match_ids)} matches")
    print(f"Will save to bucket: {TEST_BUCKET}")
    
    rapidapi_key = os.getenv('RAPIDAPI_KEY')
    if not rapidapi_key:
        raise AirflowFailException(
            "❌ Missing RAPIDAPI_KEY environment variable! "
            "Set RAPIDAPI_KEY in docker-compose.yml"
        )
    
    match_ids_json = json.dumps(match_ids)
    
    # Modified command to use test bucket
    command = f"""docker exec etl_worker python -c "
import json
import os

# Override bucket name for testing
os.environ['BRONZE_BUCKET_NAME'] = '{TEST_BUCKET}'

from etl.bronze.extractors.statistics_extractor import StatisticsFetcher

match_ids = {match_ids_json}

fetcher = StatisticsFetcher(
    rapidapi_key='{rapidapi_key}',
    tournament_id={TOURNAMENT_ID}
)

# Override storage bucket
fetcher.storage.bucket_name = '{TEST_BUCKET}'

result = fetcher.fetch_and_save_statistics(match_ids)

print('STATS_RESULT:' + json.dumps({{
    'fetched': result['successful'],
    'failed': result['failed'],
    'skipped': result['skipped'],
    'total': len(match_ids)
}}))
" """
    
    try:
        result = subprocess.run(
            command, 
            shell=True, 
            capture_output=True, 
            text=True, 
            timeout=300  # 5 minutes for test
        )
        
        if result.returncode != 0:
            print(f"⚠️ Execution error: {result.stderr}")
            print(f"📋 stdout: {result.stdout}")
            raise AirflowFailException("Statistics extraction failed")
        
        print(f"📋 Output:\n{result.stdout}")
        
        for line in result.stdout.split('\n'):
            if line.startswith('STATS_RESULT:'):
                stats_result = json.loads(line.replace('STATS_RESULT:', ''))
                print(f"\n✅ TEST RESULTS:")
                print(f"  • Fetched: {stats_result['fetched']}")
                print(f"  • Failed: {stats_result['failed']}")
                print(f"  • Skipped: {stats_result['skipped']}")
                print(f"  • Total: {stats_result['total']}")
                print(f"  • Bucket used: {TEST_BUCKET}")
                return stats_result
        
        raise AirflowFailException("No valid result from statistics fetch")
        
    except subprocess.TimeoutExpired:
        print(f"⚠️ Timeout - process exceeded 5 minutes")
        raise AirflowFailException("Statistics fetch timeout")
    except Exception as e:
        print(f"⚠️ Error: {type(e).__name__}: {e}")
        raise

def verify_test_data(**context):
    """Verify statistics were written to test bucket"""
    print("🔍 Verifying test statistics in test bucket...")
    
    command = f"""docker exec etl_worker python -c "
from etl.bronze.client import get_minio_client

minio_client = get_minio_client()

# List statistics objects in test bucket
prefix = 'match_statistics/'
objects = list(minio_client.list_objects('{TEST_BUCKET}', prefix=prefix, recursive=True))

print(f'Found {{len(objects)}} statistics files in {TEST_BUCKET}')

if objects:
    print('Statistics files:')
    for i, obj in enumerate(objects):
        print(f'  {{i+1}}. {{obj.object_name}} ({{obj.size}} bytes)')
    
    # Try to read one file
    if objects:
        test_obj = objects[0]
        response = minio_client.get_object('{TEST_BUCKET}', test_obj.object_name)
        data = response.read()
        print(f'\\n✅ Successfully read test file: {{test_obj.object_name}} ({{len(data)}} bytes)')
else:
    print(f'⚠️ No statistics files found in {TEST_BUCKET}')
" """
    
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    print(result.stdout)

def cleanup_test_data(**context):
    """Clean up test bucket"""
    print("🧹 Cleaning up test data...")
    
    command = f"""docker exec etl_worker python -c "
from etl.bronze.client import get_minio_client

minio_client = get_minio_client()

objects = list(minio_client.list_objects('{TEST_BUCKET}', recursive=True))
for obj in objects:
    minio_client.remove_object('{TEST_BUCKET}', obj.object_name)
    
print(f'🧹 Removed {{len(objects)}} objects from {TEST_BUCKET}')
" """
    
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    print(result.stdout)

# DAG
with DAG(
    'test_03_bronze_extract_stats',
    default_args={
        'owner': 'airflow',
        'retries': 0,
    },
    description='[TEST] Test statistics extraction without affecting production data',
    schedule=None,
    start_date=datetime(2024, 1, 1),
    catchup=False,
    tags=['test', 'ekstraklasa', 'statistics', 'bronze']
) as dag:
    
    setup_test = PythonOperator(
        task_id='setup_test_bucket',
        python_callable=setup_test_bucket
    )
    
    get_test_matches = PythonOperator(
        task_id='get_test_matches',
        python_callable=get_test_match_ids
    )
    
    test_fetch = PythonOperator(
        task_id='test_fetch_stats',
        python_callable=test_fetch_statistics,
        execution_timeout=timedelta(minutes=10)
    )
    
    verify = PythonOperator(
        task_id='verify_test_data',
        python_callable=verify_test_data
    )
    
    cleanup = PythonOperator(
        task_id='cleanup_test_data',
        python_callable=cleanup_test_data,
        trigger_rule='all_done'
    )
    
    setup_test >> get_test_matches >> test_fetch >> verify >> cleanup
