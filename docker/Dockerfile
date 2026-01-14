FROM apache/airflow:3.0.6

# Install curl for health checks
USER root
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copy entrypoint wrapper script
COPY airflow-entrypoint.sh /opt/airflow/airflow-entrypoint.sh
RUN chmod +x /opt/airflow/airflow-entrypoint.sh

# Copy requirements file
USER airflow
COPY requirements.txt /opt/airflow/requirements.txt

# Install additional packages for S3/MinIO integration
RUN pip install --no-cache-dir -r /opt/airflow/requirements.txt

# Set entrypoint to wrapper script
ENTRYPOINT ["/opt/airflow/airflow-entrypoint.sh"]
