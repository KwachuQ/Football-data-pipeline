"""
DAG: API Usage Report Generator
Reports API consumption across all pipeline runs
"""
from datetime import datetime, timedelta, timezone
from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.empty import EmptyOperator
import json
import logging
from pathlib import Path

default_args = {
    'owner': 'data_engineering',
    'depends_on_past': False,
    'start_date': None,
    'email_on_failure': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}


def generate_api_usage_report(**context):
    """Generate comprehensive API usage report"""
    logging.info("Generating API usage report from logs...")
    
    log_file = Path("/opt/var/logs/api_usage.jsonl")
    
    if not log_file.exists():
        logging.warning(f"No API usage log found at {log_file}")
        return {'message': 'no_data', 'total_requests': 0}
    
    # Parse log file
    records = []
    with open(log_file, 'r') as f:
        for line in f:
            try:
                records.append(json.loads(line.strip()))
            except json.JSONDecodeError:
                continue
    
    if not records:
        logging.warning("No valid records in API usage log")
        return {'message': 'no_records', 'total_requests': 0}
    
    # Aggregate statistics
    total_requests = len(records)
    successful = sum(1 for r in records if r['status_code'] == 200)
    failed = sum(1 for r in records if r['status_code'] >= 400)
    rate_limited = sum(1 for r in records if r['status_code'] == 429)
    
    # Count by endpoint
    endpoint_counts = {}
    for record in records:
        endpoint = record['endpoint']
        endpoint_counts[endpoint] = endpoint_counts.get(endpoint, 0) + 1
    
    # Count by DAG
    dag_counts = {}
    for record in records:
        dag_id = record.get('dag_id', 'unknown')
        dag_counts[dag_id] = dag_counts.get(dag_id, 0) + 1
    
    # Print report
    logging.info("\n" + "="*70)
    logging.info("API USAGE REPORT")
    logging.info("="*70)
    logging.info(f"Total API Requests:    {total_requests:,}")
    logging.info(f"Successful (200):      {successful:,}")
    logging.info(f"Failed (4xx/5xx):      {failed:,}")
    logging.info(f"Rate Limited (429):    {rate_limited:,}")
    logging.info(f"Success Rate:          {(successful/total_requests*100):.1f}%")
    
    logging.info(f"\nRequests by Endpoint:")
    for endpoint, count in sorted(endpoint_counts.items(), key=lambda x: x[1], reverse=True):
        logging.info(f"  • {endpoint}: {count:,}")
    
    logging.info(f"\nRequests by DAG:")
    for dag_id, count in sorted(dag_counts.items(), key=lambda x: x[1], reverse=True):
        logging.info(f"  • {dag_id}: {count:,}")
    
    logging.info("="*70 + "\n")
    
    # Return summary for XCom
    return {
        'total_requests': total_requests,
        'successful': successful,
        'failed': failed,
        'rate_limited': rate_limited,
        'success_rate': f"{(successful/total_requests*100):.1f}%",
        'top_endpoints': dict(sorted(endpoint_counts.items(), key=lambda x: x[1], reverse=True)[:5]),
        'top_dags': dict(sorted(dag_counts.items(), key=lambda x: x[1], reverse=True)[:5])
    }


def estimate_monthly_usage(**context):
    """Estimate monthly API usage based on current patterns"""
    ti = context['ti']
    report = ti.xcom_pull(task_ids='generate_report')
    
    if not report or report.get('message') in ('no_data', 'no_records'):
        logging.warning("No data to estimate monthly usage")
        return {'message': 'no_data'}
    
    total_requests = report['total_requests']
    
    log_file = Path("/opt/var/logs/api_usage.jsonl")
    
    with open(log_file, 'r') as f:
        first_line = f.readline()
        first_record = json.loads(first_line)
        first_date = datetime.fromisoformat(first_record['timestamp'])
    
   
    now = datetime.now(timezone.utc)
    
    # Jeśli first_date nie ma timezone, dodaj UTC
    if first_date.tzinfo is None:
        first_date = first_date.replace(tzinfo=timezone.utc)
    
    days_tracked = (now - first_date).days + 1
    daily_avg = total_requests / days_tracked if days_tracked > 0 else 0
    monthly_estimate = daily_avg * 30
    
    logging.info("\n" + "="*70)
    logging.info("MONTHLY API USAGE ESTIMATE")
    logging.info("="*70)
    logging.info(f"Days Tracked:              {days_tracked}")
    logging.info(f"Total Requests:            {total_requests:,}")
    logging.info(f"Daily Average:             {daily_avg:.0f}")
    logging.info(f"Estimated Monthly Usage:   {monthly_estimate:,.0f}")
    
    # RapidAPI tier recommendations
    if monthly_estimate <= 500:
        tier = "Free (500/month)"
        monthly_cost = "$0"
    elif monthly_estimate <= 10000:
        tier = "Basic (10,000/month)"
        monthly_cost = "$9.99"
    elif monthly_estimate <= 50000:
        tier = "Pro (50,000/month)"
        monthly_cost = "$49.99"
    else:
        tier = "Mega (Unlimited)"
        monthly_cost = "$149.99"
    
    logging.info(f"\nRecommended RapidAPI Tier: {tier}")
    logging.info(f"Estimated Monthly Cost:    {monthly_cost}")
    logging.info("="*70 + "\n")
    
    return {
        'days_tracked': days_tracked,
        'daily_average': daily_avg,
        'monthly_estimate': monthly_estimate,
        'recommended_tier': tier,
        'estimated_cost': monthly_cost
    }


with DAG(
    dag_id='99_api_usage_report',
    default_args=default_args,
    description='Generate API usage report and cost estimates',
    schedule=None,
    catchup=False,
    max_active_runs=1,
    tags=['monitoring', 'api', 'report', 'cost-tracking']
) as dag:
    
    start = EmptyOperator(task_id='start')
    
    generate_report = PythonOperator(
        task_id='generate_report',
        python_callable=generate_api_usage_report
    )
    
    estimate_usage = PythonOperator(
        task_id='estimate_monthly_usage',
        python_callable=estimate_monthly_usage
    )
    
    end = EmptyOperator(task_id='end')
    
    start >> generate_report >> estimate_usage >> end