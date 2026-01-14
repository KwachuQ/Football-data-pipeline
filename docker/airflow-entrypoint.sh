#!/bin/bash
# Airflow entrypoint wrapper that reads secrets and sets environment variables

set -e

# Read secrets if available and export as environment variables
if [ -f /run/secrets/airflow_fernet_key ]; then
    export AIRFLOW__CORE__FERNET_KEY=$(cat /run/secrets/airflow_fernet_key | tr -d '\n\r')
fi

if [ -f /run/secrets/airflow_jwt_secret ]; then
    export AIRFLOW__API_AUTH__JWT_SECRET=$(cat /run/secrets/airflow_jwt_secret | tr -d '\n\r')
fi

if [ -f /run/secrets/rapidapi_key ]; then
    export RAPIDAPI_KEY=$(cat /run/secrets/rapidapi_key | tr -d '\n\r')
fi

if [ -f /run/secrets/postgres_user ]; then
    export POSTGRES_USER=$(cat /run/secrets/postgres_user | tr -d '\n\r')
fi

if [ -f /run/secrets/postgres_password ]; then
    export POSTGRES_PASSWORD=$(cat /run/secrets/postgres_password | tr -d '\n\r')
fi

# Execute the original command
exec "$@"
