#!/usr/bin/env bash
set -e

# Create MinIO connection for Airflow
echo "[INFO] >>> Running create_minio_conn.sh <<<"

# Read credentials from Docker secrets
MINIO_USER=$(cat /run/secrets/minio_root_user 2>/dev/null | tr -d '\n' || echo "minio")
MINIO_PASSWORD=$(cat /run/secrets/minio_root_password 2>/dev/null | tr -d '\n' || echo "minio123")

# Check if connection already exists
if airflow connections get minio_s3 >/dev/null 2>&1; then
    echo "[INFO] Connection minio_s3 already exists – skipping creation"
else
    echo "[INFO] Creating minio_s3 connection..."
    airflow connections add 'minio_s3' \
        --conn-type 'aws' \
        --conn-extra "{\"aws_access_key_id\": \"$MINIO_USER\", \"aws_secret_access_key\": \"$MINIO_PASSWORD\", \"endpoint_url\": \"http://minio:9000\", \"region_name\": \"eu-central-1\"}" \
        --conn-login "$MINIO_USER" \
        --conn-password "$MINIO_PASSWORD"
    echo "[SUCCESS] Connection minio_s3 created successfully"
fi