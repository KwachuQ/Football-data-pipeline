#!/usr/bin/env bash
set -e

echo "Creating PostgreSQL connection..."

# Read credentials from Docker secrets
POSTGRES_USER=$(cat /run/secrets/postgres_user 2>/dev/null | tr -d '\n' || echo "airflow")
POSTGRES_PASSWORD=$(cat /run/secrets/postgres_password 2>/dev/null | tr -d '\n' || echo "airflow")

if airflow connections get postgres_default >/dev/null 2>&1; then
  echo "Connection postgres_default already exists – skipping"
else
  airflow connections add postgres_default \
    --conn-type postgres \
    --conn-host postgres \
    --conn-login "$POSTGRES_USER" \
    --conn-password "$POSTGRES_PASSWORD" \
    --conn-schema dwh \
    --conn-port 5432
  echo "PostgreSQL connection created successfully!"
fi