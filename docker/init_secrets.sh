#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

if [ ! -f .env ]; then
    echo "Creating .env from template..."
    cp .env.template .env
fi

if ! grep -q "AIRFLOW__CORE__FERNET_KEY=.\+" .env; then
    echo "Generating Fernet key..."
    FERNET_KEY=$(python -c "from cryptography.fernet import Fernet; print(Fernet.generate_key().decode())")
    sed -i "s|AIRFLOW__CORE__FERNET_KEY=.*|AIRFLOW__CORE__FERNET_KEY=$FERNET_KEY|" .env
    echo "Fernet key generated"
fi

if ! grep -q "AIRFLOW__API_AUTH__JWT_SECRET=.\+" .env; then
    echo "Generating JWT secret..."
    JWT_SECRET=$(python -c "import secrets; print(secrets.token_urlsafe(32))")
    sed -i "s|AIRFLOW__API_AUTH__JWT_SECRET=.*|AIRFLOW__API_AUTH__JWT_SECRET=$JWT_SECRET|" .env
    echo "JWT secret generated"
fi

echo "Setup complete. Edit .env to add your RAPIDAPI_KEY, then run: docker-compose up -d"