#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

# Create secrets directory if not exists
mkdir -p secrets

echo "Initializing Docker Secrets..."
echo ""

# ====================================
# Local Development Secrets
# ====================================

# Generate Postgres secrets (default values for development)
if [ ! -f secrets/postgres_user.txt ]; then
    echo -n "airflow" > secrets/postgres_user.txt
    echo "✓ Generated postgres_user secret"
fi

if [ ! -f secrets/postgres_password.txt ]; then
    echo -n "airflow" > secrets/postgres_password.txt
    echo "✓ Generated postgres_password secret (CHANGE FOR PRODUCTION!)"
fi

# Generate MinIO secrets
if [ ! -f secrets/minio_root_user.txt ]; then
    echo -n "minio" > secrets/minio_root_user.txt
    echo "✓ Generated minio_root_user secret"
fi

if [ ! -f secrets/minio_root_password.txt ]; then
    echo -n "minio123" > secrets/minio_root_password.txt
    echo "✓ Generated minio_root_password secret (CHANGE FOR PRODUCTION!)"
fi

# Generate Fernet key
if [ ! -f secrets/airflow_fernet_key.txt ]; then
    python3 -c "from cryptography.fernet import Fernet; print(Fernet.generate_key().decode(), end='')" > secrets/airflow_fernet_key.txt
    echo "✓ Generated Fernet key"
fi

# Generate JWT secret
if [ ! -f secrets/airflow_jwt_secret.txt ]; then
    python3 -c "import secrets; print(secrets.token_urlsafe(32), end='')" > secrets/airflow_jwt_secret.txt
    echo "✓ Generated JWT secret"
fi

# RapidAPI key placeholder
if [ ! -f secrets/rapidapi_key.txt ]; then
    echo -n "your_rapidapi_key_here" > secrets/rapidapi_key.txt
    echo "⚠ Created rapidapi_key placeholder - EDIT THIS FILE with your actual key!"
fi

# ====================================
# AWS RDS Secrets
# ====================================

# AWS RDS host
if [ ! -f secrets/aws_rds_host.txt ]; then
    echo -n "football-data-db.cdagem22a9jh.eu-north-1.rds.amazonaws.com" > secrets/aws_rds_host.txt
    echo "✓ Generated aws_rds_host secret"
fi

# AWS RDS password placeholder
if [ ! -f secrets/aws_rds_password.txt ]; then
    echo -n "your_aws_rds_password_here" > secrets/aws_rds_password.txt
    echo "⚠ Created aws_rds_password placeholder - EDIT THIS FILE with your actual password!"
fi

echo ""
echo "=========================================="
echo "Setup complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Edit secrets/rapidapi_key.txt with your actual RapidAPI key"
echo "2. Edit secrets/aws_rds_password.txt with your actual AWS RDS password"
echo "3. For production, change passwords in secrets/*.txt files"
echo "4. Run: docker-compose up -d"
echo ""