from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.trigger_dagrun import TriggerDagRunOperator
from airflow.operators.python import PythonOperator
from airflow.operators.empty import EmptyOperator
import logging

default_args = {
    'owner': 'data_engineering',
    'depends_on_past': False,
    'start_date': datetime(2025, 1, 1),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 0,  # Orchestrator should not retry - individual DAGs handle retries
    'retry_delay': timedelta(minutes=5),
}

def log_pipeline_start(**context):
    """Log pipeline initialization"""
    logging.info("="*70)
    logging.info("HISTORICAL DATA PIPELINE - FULL LOAD")
    logging.info("="*70)
    logging.info("This pipeline will execute the following steps:")
    logging.info("  1. Extract historical matches from API")
    logging.info("  2. Load matches to Bronze layer")
    logging.info("  3. Extract historical statistics from API")
    logging.info("  4. Load statistics to Bronze layer")
    logging.info("  5. Create Silver staging tables")
    logging.info("  6. Transform Silver layer (dbt)")
    logging.info("  7. Transform Gold layer (dbt)")
    logging.info("="*70)
    logging.info("Starting pipeline execution...")
    return True

def log_step_completion(step_name):
    """Factory function to create step completion loggers"""
    def _log(**context):
        logging.info(f"✓ Completed: {step_name}")
        return True
    return _log

def log_pipeline_completion(**context):
    """Log pipeline completion"""
    logging.info("="*70)
    logging.info("✓ HISTORICAL DATA PIPELINE COMPLETED SUCCESSFULLY")
    logging.info("="*70)
    logging.info("All layers have been populated:")
    logging.info("  ✓ Bronze: Raw matches and statistics")
    logging.info("  ✓ Silver: Staging and transformed tables")
    logging.info("  ✓ Gold: Analytics marts")
    logging.info("="*70)
    logging.info("The data warehouse is ready for analytics!")
    return True

with DAG(
    dag_id='00_historical_pipeline_orchestrator',
    default_args=default_args,
    description='Orchestrates full historical data load pipeline from Bronze to Gold',
    schedule=None,  # Manual trigger only
    catchup=False,
    max_active_runs=1,
    tags=['orchestrator', 'historical', 'full-load', 'pipeline']
) as dag:
    
    start = EmptyOperator(task_id='start')
    
    log_start = PythonOperator(
        task_id='log_pipeline_start',
        python_callable=log_pipeline_start
    )
    
    # ========================================================================
    # STEP 1: Extract Historical Matches
    # ========================================================================
    
    trigger_extract_matches = TriggerDagRunOperator(
        task_id='trigger_extract_matches',
        trigger_dag_id='10_bronze_extract_historical_matches',
        wait_for_completion=True,
        poke_interval=30,
        reset_dag_run=True,
        allowed_states=['success'],
        failed_states=['failed', 'skipped']
    )
    
    log_extract_matches_done = PythonOperator(
        task_id='log_extract_matches_done',
        python_callable=log_step_completion('Extract Historical Matches')
    )
    
    # ========================================================================
    # STEP 2: Load Matches to Bronze
    # ========================================================================
    
    trigger_load_matches = TriggerDagRunOperator(
        task_id='trigger_load_matches',
        trigger_dag_id='11_bronze_load_historical_matches',
        wait_for_completion=True,
        poke_interval=30,
        reset_dag_run=True,
        allowed_states=['success'],
        failed_states=['failed', 'skipped']
    )
    
    log_load_matches_done = PythonOperator(
        task_id='log_load_matches_done',
        python_callable=log_step_completion('Load Matches to Bronze (includes dbt)')
    )
    
    # ========================================================================
    # STEP 3: Extract Historical Statistics
    # ========================================================================
    
    trigger_extract_stats = TriggerDagRunOperator(
        task_id='trigger_extract_stats',
        trigger_dag_id='12_bronze_extract_historical_stats',
        wait_for_completion=True,
        poke_interval=30,
        reset_dag_run=True,
        allowed_states=['success'],
        failed_states=['failed', 'skipped']
    )
    
    log_extract_stats_done = PythonOperator(
        task_id='log_extract_stats_done',
        python_callable=log_step_completion('Extract Historical Statistics')
    )
    
    # ========================================================================
    # STEP 4: Load Statistics to Bronze
    # ========================================================================
    
    trigger_load_stats = TriggerDagRunOperator(
        task_id='trigger_load_stats',
        trigger_dag_id='13_bronze_load_historical_stats',
        wait_for_completion=True,
        poke_interval=30,
        reset_dag_run=True,
        allowed_states=['success'],
        failed_states=['failed', 'skipped']
    )
    
    log_load_stats_done = PythonOperator(
        task_id='log_load_stats_done',
        python_callable=log_step_completion('Load Statistics to Bronze (includes dbt)')
    )
    
    # ========================================================================
    # STEP 5: Create Silver Staging Tables
    # ========================================================================
    
    trigger_silver_staging = TriggerDagRunOperator(
        task_id='trigger_silver_staging',
        trigger_dag_id='14_silver_stage_full',
        wait_for_completion=True,
        poke_interval=30,
        reset_dag_run=True,
        allowed_states=['success'],
        failed_states=['failed', 'skipped']
    )
    
    log_silver_staging_done = PythonOperator(
        task_id='log_silver_staging_done',
        python_callable=log_step_completion('Create Silver Staging Tables')
    )
    
    # ========================================================================
    # STEP 6: Transform Silver Layer (dbt)
    # ========================================================================
    
    trigger_silver_transform = TriggerDagRunOperator(
        task_id='trigger_silver_transform',
        trigger_dag_id='06_silver_transform_dbt',
        wait_for_completion=True,
        poke_interval=30,
        reset_dag_run=True,
        allowed_states=['success'],
        failed_states=['failed', 'skipped']
    )
    
    log_silver_transform_done = PythonOperator(
        task_id='log_silver_transform_done',
        python_callable=log_step_completion('Transform Silver Layer (dbt)')
    )
    
    # ========================================================================
    # STEP 7: Transform Gold Layer (dbt)
    # ========================================================================
    
    trigger_gold_transform = TriggerDagRunOperator(
        task_id='trigger_gold_transform',
        trigger_dag_id='07_gold_transform_dbt',
        wait_for_completion=True,
        poke_interval=30,
        reset_dag_run=True,
        allowed_states=['success'],
        failed_states=['failed', 'skipped']
    )
    
    log_gold_transform_done = PythonOperator(
        task_id='log_gold_transform_done',
        python_callable=log_step_completion('Transform Gold Layer (dbt)')
    )
    
    # ========================================================================
    # Pipeline Completion
    # ========================================================================
    
    log_completion = PythonOperator(
        task_id='log_pipeline_completion',
        python_callable=log_pipeline_completion
    )
    
    end = EmptyOperator(task_id='end')
    
    # ========================================================================
    # Define Pipeline Flow
    # ========================================================================
    
    start >> log_start
    
    # Step 1: Extract Matches
    log_start >> trigger_extract_matches >> log_extract_matches_done
    
    # Step 2: Load Matches
    log_extract_matches_done >> trigger_load_matches >> log_load_matches_done
    
    # Step 3: Extract Stats
    log_load_matches_done >> trigger_extract_stats >> log_extract_stats_done
    
    # Step 4: Load Stats
    log_extract_stats_done >> trigger_load_stats >> log_load_stats_done
    
    # Step 5: Silver Staging
    log_load_stats_done >> trigger_silver_staging >> log_silver_staging_done
    
    # Step 6: Silver Transform
    log_silver_staging_done >> trigger_silver_transform >> log_silver_transform_done
    
    # Step 7: Gold Transform
    log_silver_transform_done >> trigger_gold_transform >> log_gold_transform_done
    
    # Completion
    log_gold_transform_done >> log_completion >> end