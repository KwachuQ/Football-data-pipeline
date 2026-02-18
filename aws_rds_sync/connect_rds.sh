#!/bin/bash

# AWS RDS Connection Script (secrets-enabled)
# Usage: ./connect_rds.sh [query]

set -e  # Exit on error

# ====================================
# Configuration from Secrets
# ====================================

# Path to secrets (relative from script location)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SECRETS_DIR="${SCRIPT_DIR}/../docker/secrets"
CERT_PATH="${SCRIPT_DIR}/certs/global-bundle.pem"

# Read secrets (with fallback for backward compatibility)
read_secret() {
    local secret_name=$1
    local secret_file="${SECRETS_DIR}/${secret_name}.txt"
    if [ -f "$secret_file" ]; then
        cat "$secret_file" | tr -d '\n'
    else
        echo ""
    fi
}

# Configuration from secrets
DB_HOST=$(read_secret "aws_rds_host")
DB_PASSWORD=$(read_secret "aws_rds_password")

# Fallback to defaults if secrets not found (for backward compatibility)
if [ -z "$DB_HOST" ]; then
    echo "WARNING: aws_rds_host not found in secrets, using default"
    DB_HOST="football-data.c4j2oaoos6s8.us-east-1.rds.amazonaws.com"
fi

DB_PORT="5432"
DB_NAME="postgres"
DB_USER="dbadmin"

if [ -z "$DB_PASSWORD" ]; then
    echo "ERROR: AWS RDS password not found in secrets!"
    echo "Create: ${SECRETS_DIR}/aws_rds_password.txt"
    exit 1
fi

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ====================================
# Check SSL Certificate
# ====================================
if [ ! -f "$CERT_PATH" ]; then
    echo -e "${RED}❌ SSL certificate not found: ${CERT_PATH}${NC}"
    echo "Expected location: ${CERT_PATH}"
    exit 1
fi

# ====================================
# Disable path conversion for Windows Git Bash
# ====================================
export MSYS_NO_PATHCONV=1

# ====================================
# Connection string (using local certificate path)
# ====================================
CONN_STR="host=${DB_HOST} port=${DB_PORT} dbname=${DB_NAME} user=${DB_USER} sslrootcert=${CERT_PATH} sslmode=verify-full password=${DB_PASSWORD}"

# ====================================
# Functions
# ====================================

check_psql() {
    if ! command -v psql &> /dev/null; then
        echo -e "${RED}❌ psql not found!${NC}"
        echo "Options:"
        echo "1. Install PostgreSQL client tools"
        echo "2. Use Docker: Install psql in container or use Python script instead"
        return 1
    fi
    return 0
}

test_connection() {
    echo -e "${YELLOW}Testing connection to AWS RDS...${NC}"
    
    # Show what we're connecting to (without password)
    echo "Host: ${DB_HOST}"
    echo "Port: ${DB_PORT}"
    echo "Database: ${DB_NAME}"
    echo "User: ${DB_USER}"
    echo "SSL Cert: ${CERT_PATH}"
    echo ""
    
    # Check if psql is available locally
    if command -v psql &> /dev/null; then
        # Use local psql (preferred - like Python script)
        echo "Using local psql client..."
        
        if ERROR_OUTPUT=$(PGPASSWORD="${DB_PASSWORD}" psql -h "${DB_HOST}" -p "${DB_PORT}" -d "${DB_NAME}" -U "${DB_USER}" \
            --set=sslmode=verify-full --set=sslrootcert="${CERT_PATH}" \
            -c "SELECT version();" 2>&1); then
            echo -e "${GREEN}✅ Connection successful!${NC}"
            echo "${ERROR_OUTPUT}"
            return 0
        else
            echo -e "${RED}❌ Connection failed!${NC}"
            echo ""
            echo -e "${YELLOW}Error details:${NC}"
            echo "${ERROR_OUTPUT}"
            echo ""
            echo -e "${YELLOW}Troubleshooting:${NC}"
            echo "1. Verify certificate: ls -la ${CERT_PATH}"
            echo "2. Check AWS RDS security group allows your IP"
            echo "3. Verify password in: ${SECRETS_DIR}/aws_rds_password.txt"
            return 1
        fi
    elif command -v python &> /dev/null && [ -f "${SCRIPT_DIR}/connect_rds.py" ]; then
        # Use Python script if available (works like the original Python implementation)
        echo "Using Python psycopg2 client..."
        
        # Convert Unix path to Windows path for Python (handle both Git Bash and WSL paths)
        # /c/Users/... -> C:/Users/...
        WIN_CERT_PATH=$(echo "${CERT_PATH}" | sed 's|^/\([a-z]\)/|\U\1:/|')
        
        # Call Python with inline script using Windows path
        python -c "
import psycopg2
import os

cert_path = r'${WIN_CERT_PATH}'

try:
    conn = psycopg2.connect(
        host='${DB_HOST}',
        port=${DB_PORT},
        database='${DB_NAME}',
        user='${DB_USER}',
        password='${DB_PASSWORD}',
        sslmode='verify-full',
        sslrootcert=cert_path
    )
    cur = conn.cursor()
    cur.execute('SELECT version();')
    print(cur.fetchone()[0])
    cur.close()
    conn.close()
    exit(0)
except Exception as e:
    print(f'Database error: {e}')
    exit(1)
"
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ Connection successful!${NC}"
            return 0
        else
            echo -e "${RED}❌ Connection failed!${NC}"
            return 1
        fi
    elif docker ps > /dev/null 2>&1; then
        # Fallback to Docker if available - mount the certificate directory
        echo "Using Docker postgres container..."
        echo -e "${YELLOW}Note: Mounting certificate directory to container${NC}"
        
        # Use docker run with volume mount instead of exec
        if ERROR_OUTPUT=$(docker run --rm \
            -v "${SCRIPT_DIR}/certs:/certs:ro" \
            postgres:latest \
            psql "host=${DB_HOST} port=${DB_PORT} dbname=${DB_NAME} user=${DB_USER} sslrootcert=/certs/global-bundle.pem sslmode=verify-full password=${DB_PASSWORD}" \
            -c "SELECT version();" 2>&1); then
            echo -e "${GREEN}✅ Connection successful!${NC}"
            echo "${ERROR_OUTPUT}"
            return 0
        else
            echo -e "${RED}❌ Connection failed!${NC}"
            echo ""
            echo -e "${YELLOW}Error details:${NC}"
            echo "${ERROR_OUTPUT}"
            echo ""
            echo -e "${YELLOW}Note:${NC} Docker method requires proper certificate mounting"
            return 1
        fi
    else
        echo -e "${RED}❌ No suitable PostgreSQL client found!${NC}"
        echo ""
        echo "Available options:"
        echo "1. Install PostgreSQL client (psql): https://www.postgresql.org/download/"
        echo "2. Install Python psycopg2: pip install psycopg2-binary"
        echo "3. Start Docker"
        echo ""
        echo "Or use the working Python script: python connect_rds.py"
        return 1
    fi
}

interactive_mode() {
    echo -e "${GREEN}Starting interactive session...${NC}"
    echo "Type SQL queries or PostgreSQL commands (\\q to quit)"
    echo "---------------------------------------------------"
    
    if command -v psql &> /dev/null; then
        PGPASSWORD="${DB_PASSWORD}" psql -h "${DB_HOST}" -p "${DB_PORT}" -d "${DB_NAME}" -U "${DB_USER}"
    elif command -v python &> /dev/null; then
        echo -e "${YELLOW}Note: Using Python interactive mode (limited features)${NC}"
        echo "For full features, install psql: https://www.postgresql.org/download/"
        echo ""
        
        # Convert Unix path to Windows path for Python
        WIN_CERT_PATH=$(echo "${CERT_PATH}" | sed 's|^/\([a-z]\)/|\U\1:/|')
        
        python -c "
import psycopg2

cert_path = r'${WIN_CERT_PATH}'
conn = psycopg2.connect(
    host='${DB_HOST}',
    port=${DB_PORT},
    database='${DB_NAME}',
    user='${DB_USER}',
    password='${DB_PASSWORD}',
    sslmode='verify-full',
    sslrootcert=cert_path
)
conn.autocommit = True
cur = conn.cursor()

print('Connected to AWS RDS PostgreSQL')
print('Type SQL queries (Ctrl+C or \"exit\" to quit)')
print()

while True:
    try:
        query = input('postgres=> ')
        if not query.strip():
            continue
        if query.strip().lower() in ('exit', 'quit', '\\q'):
            break
        
        cur.execute(query)
        
        # Fetch results if available
        if cur.description:
            rows = cur.fetchall()
            if rows:
                # Print column names
                print(' | '.join([desc[0] for desc in cur.description]))
                print('-' * 80)
                # Print rows
                for row in rows:
                    print(' | '.join([str(val) for val in row]))
            print(f'({len(rows)} row(s))')
        else:
            print('Query executed successfully')
        print()
    except KeyboardInterrupt:
        print()
        break
    except Exception as e:
        print(f'Error: {e}')
        print()

cur.close()
conn.close()
"
    else
        docker exec -it postgres psql "${CONN_STR}"
    fi
}

run_query() {
    local query="$1"
    echo -e "${YELLOW}Running query:${NC} ${query}"
    echo "---------------------------------------------------"
    
    if command -v psql &> /dev/null; then
        PGPASSWORD="${DB_PASSWORD}" psql -h "${DB_HOST}" -p "${DB_PORT}" -d "${DB_NAME}" -U "${DB_USER}" -c "${query}"
    elif command -v python &> /dev/null; then
        # Convert Unix path to Windows path for Python
        WIN_CERT_PATH=$(echo "${CERT_PATH}" | sed 's|^/\([a-z]\)/|\U\1:/|')
        
        python -c "
import psycopg2

cert_path = r'${WIN_CERT_PATH}'
conn = psycopg2.connect(
    host='${DB_HOST}',
    port=${DB_PORT},
    database='${DB_NAME}',
    user='${DB_USER}',
    password='${DB_PASSWORD}',
    sslmode='verify-full',
    sslrootcert=cert_path
)
cur = conn.cursor()
cur.execute('''${query}''')

if cur.description:
    rows = cur.fetchall()
    if rows:
        # Print column names
        print(' | '.join([desc[0] for desc in cur.description]))
        print('-' * 80)
        # Print rows
        for row in rows:
            print(' | '.join([str(val) for val in row]))
    print(f'({len(rows)} row(s))')
else:
    print('Query executed successfully')

cur.close()
conn.close()
"
    else
        docker exec -i postgres psql "${CONN_STR}" -c "${query}"
    fi
}

show_help() {
    cat <<HELP
AWS RDS Connection Script (Secrets-Enabled)

Usage:
  ./connect_rds.sh                     # Interactive mode
  ./connect_rds.sh test                # Test connection
  ./connect_rds.sh "SELECT * FROM ..." # Run a single query
  ./connect_rds.sh help                # Show this help

Examples:
  ./connect_rds.sh
  ./connect_rds.sh test
  ./connect_rds.sh "SELECT COUNT(*) FROM gold.mart_team_overview;"
  ./connect_rds.sh "\\dt gold.*"

Connection details:
  Host: ${DB_HOST}
  Port: ${DB_PORT}
  Database: ${DB_NAME}
  User: ${DB_USER}
  Password: (loaded from ${SECRETS_DIR}/aws_rds_password.txt)
HELP
}

# ====================================
# Main
# ====================================

# Parse arguments
case "${1:-}" in
    "")
        # No arguments - interactive mode
        test_connection && interactive_mode
        ;;
    "test")
        test_connection
        ;;
    "help"|"-h"|"--help")
        show_help
        ;;
    *)
        # Run query
        run_query "$1"
        ;;
esac
