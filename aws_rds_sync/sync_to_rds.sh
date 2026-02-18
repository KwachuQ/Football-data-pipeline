#!/bin/bash

# Sync gold_clean.sql and silver_clean.sql to AWS RDS
# Usage: ./sync_to_rds.sh [--silver-only | --gold-only | --dry-run]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SECRETS_DIR="${SCRIPT_DIR}/../docker/secrets"
CERT_PATH="${SCRIPT_DIR}/certs/global-bundle.pem"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# ====================================
# Read secrets
# ====================================
read_secret() {
    local secret_name=$1
    local secret_file="${SECRETS_DIR}/${secret_name}.txt"
    if [ -f "$secret_file" ]; then
        cat "$secret_file" | tr -d '\n'
    else
        echo ""
    fi
}

DB_HOST=$(read_secret "aws_rds_host")
DB_PASSWORD=$(read_secret "aws_rds_password")
DB_PORT="${DB_PORT:-5432}"
DB_NAME="${DB_NAME:-postgres}"
DB_USER="${DB_USER:-dbadmin}"

if [ -z "$DB_HOST" ] || [ -z "$DB_PASSWORD" ]; then
    echo -e "${RED}❌ Missing AWS RDS secrets!${NC}"
    echo "Ensure docker/secrets/aws_rds_host.txt and aws_rds_password.txt exist"
    exit 1
fi

if [ ! -f "$CERT_PATH" ]; then
    echo -e "${RED}❌ SSL certificate not found at: ${CERT_PATH}${NC}"
    echo "Download from: https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem"
    exit 1
fi

# Disable MSYS path conversion (Git Bash on Windows)
export MSYS_NO_PATHCONV=1

# ====================================
# Parse arguments
# ====================================
SYNC_SILVER=true
SYNC_GOLD=true
DRY_RUN=false

for arg in "$@"; do
    case $arg in
        --silver-only) SYNC_GOLD=false ;;
        --gold-only) SYNC_SILVER=false ;;
        --dry-run) DRY_RUN=true ;;
        --help|-h)
            echo "Usage: ./sync_to_rds.sh [--silver-only | --gold-only | --dry-run]"
            echo ""
            echo "Options:"
            echo "  --silver-only   Only sync silver_clean.sql"
            echo "  --gold-only     Only sync gold_clean.sql"
            echo "  --dry-run       Test connection only, don't import"
            exit 0
            ;;
    esac
done

echo -e "${YELLOW}========================================${NC}"
echo -e "${YELLOW}  Sync to AWS RDS${NC}"
echo -e "${YELLOW}========================================${NC}"
echo ""
echo "Host: ${DB_HOST}"
echo "Port: ${DB_PORT}"
echo "Database: ${DB_NAME}"
echo "User: ${DB_USER}"
echo ""

# ====================================
# Function: Execute SQL file on RDS
# ====================================
run_sql_file() {
    local sql_file=$1
    local layer_name=$2
    
    echo -e "${YELLOW}[${layer_name}] Importing ${sql_file}...${NC}"
    
    if [ ! -f "${sql_file}" ]; then
        echo -e "${RED}  ❌ File not found: ${sql_file}${NC}"
        return 1
    fi
    
    FILE_SIZE=$(du -h "${sql_file}" | cut -f1)
    LINE_COUNT=$(wc -l < "${sql_file}")
    echo "  File size: ${FILE_SIZE} (${LINE_COUNT} lines)"
    
    if [ "$DRY_RUN" = true ]; then
        echo -e "${YELLOW}  [DRY RUN] Skipping actual import${NC}"
        return 0
    fi
    
    # Try local psql first, then Python
    if command -v psql &> /dev/null; then
        echo "  Using local psql client..."
        PGSSLMODE=verify-full PGSSLROOTCERT="${CERT_PATH}" \
        PGPASSWORD="${DB_PASSWORD}" psql \
            -h "${DB_HOST}" \
            -p "${DB_PORT}" \
            -d "${DB_NAME}" \
            -U "${DB_USER}" \
            -f "${sql_file}" \
            -v ON_ERROR_STOP=1 \
            2>&1
    elif command -v python &> /dev/null; then
        echo "  Using Python psycopg2..."
        
        # Convert paths for Windows if needed (Git Bash /c/... -> C:/...)
        WIN_CERT_PATH=$(echo "${CERT_PATH}" | sed 's|^/\([a-z]\)/|\U\1:/|')
        WIN_SQL_FILE=$(echo "${sql_file}" | sed 's|^/\([a-z]\)/|\U\1:/|')
        
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
conn.autocommit = False
cur = conn.cursor()

with open(r'${WIN_SQL_FILE}', 'r', encoding='utf-8') as f:
    lines = f.readlines()

# Filter out psql meta-commands (lines starting with backslash like \restrict)
bs = chr(92)
clean_lines = [l for l in lines if not l.startswith(bs)]
sql_content = ''.join(clean_lines)
skipped = len(lines) - len(clean_lines)
if skipped:
    print(f'  Filtered {skipped} psql meta-command lines')

try:
    cur.execute(sql_content)
    conn.commit()
    print('Import successful')
except Exception as e:
    conn.rollback()
    print(f'Import failed: {e}')
    raise
finally:
    cur.close()
    conn.close()
"
    else
        echo -e "${RED}  ❌ No psql or python available!${NC}"
        return 1
    fi
    
    local exit_code=$?
    
    if [ $exit_code -eq 0 ]; then
        echo -e "${GREEN}  ✓ ${layer_name} imported successfully${NC}"
    else
        echo -e "${RED}  ❌ ${layer_name} import failed (exit code: ${exit_code})${NC}"
        return 1
    fi
}

# ====================================
# Function: Verify RDS data
# ====================================
verify_rds() {
    local schema=$1
    echo -e "${YELLOW}Verifying ${schema} schema on RDS...${NC}"
    
    local query="SELECT table_name, table_type FROM information_schema.tables WHERE table_schema = '${schema}' ORDER BY table_name;"
    
    if command -v psql &> /dev/null; then
        PGSSLMODE=verify-full PGSSLROOTCERT="${CERT_PATH}" \
        PGPASSWORD="${DB_PASSWORD}" psql \
            -h "${DB_HOST}" \
            -p "${DB_PORT}" \
            -d "${DB_NAME}" \
            -U "${DB_USER}" \
            -c "${query}"
    elif command -v python &> /dev/null; then
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
cur.execute(\"\"\"${query}\"\"\")
rows = cur.fetchall()
print(f'table_name | table_type')
print('-' * 50)
for row in rows:
    print(f'{row[0]} | {row[1]}')
print(f'({len(rows)} tables)')
cur.close()
conn.close()
"
    fi
}

# ====================================
# Test connection first
# ====================================
echo -e "${YELLOW}Testing RDS connection...${NC}"

CONNECTION_OK=1
if command -v psql &> /dev/null; then
    if PGSSLMODE=verify-full PGSSLROOTCERT="${CERT_PATH}" \
       PGPASSWORD="${DB_PASSWORD}" psql \
        -h "${DB_HOST}" \
        -p "${DB_PORT}" \
        -d "${DB_NAME}" \
        -U "${DB_USER}" \
        -c "SELECT version();" > /dev/null 2>&1; then
        CONNECTION_OK=0
    else
        CONNECTION_OK=1
    fi
elif command -v python &> /dev/null; then
    WIN_CERT_PATH=$(echo "${CERT_PATH}" | sed 's|^/\([a-z]\)/|\U\1:/|')
    if python -c "
import psycopg2
conn = psycopg2.connect(
    host='${DB_HOST}', port=${DB_PORT}, database='${DB_NAME}',
    user='${DB_USER}', password='${DB_PASSWORD}',
    sslmode='verify-full', sslrootcert=r'${WIN_CERT_PATH}'
)
conn.close()
" 2>/dev/null; then
        CONNECTION_OK=0
    else
        CONNECTION_OK=1
    fi
else
    echo -e "${RED}❌ No psql or python available!${NC}"
    exit 1
fi

if [ $CONNECTION_OK -ne 0 ]; then
    echo -e "${RED}❌ Cannot connect to RDS!${NC}"
    echo "Check your credentials and network connectivity."
    exit 1
fi

echo -e "${GREEN}✓ Connection successful${NC}"
echo ""

if [ "$DRY_RUN" = true ]; then
    echo -e "${YELLOW}[DRY RUN MODE] - No data will be imported${NC}"
    echo ""
fi

# ====================================
# Create schemas on RDS if needed
# ====================================
echo -e "${YELLOW}Ensuring schemas exist on RDS...${NC}"

SCHEMA_SQL="CREATE SCHEMA IF NOT EXISTS silver; CREATE SCHEMA IF NOT EXISTS gold;"

if command -v psql &> /dev/null; then
    PGSSLMODE=verify-full PGSSLROOTCERT="${CERT_PATH}" \
    PGPASSWORD="${DB_PASSWORD}" psql \
        -h "${DB_HOST}" -p "${DB_PORT}" -d "${DB_NAME}" -U "${DB_USER}" \
        -c "${SCHEMA_SQL}" 2>/dev/null
elif command -v python &> /dev/null; then
    WIN_CERT_PATH=$(echo "${CERT_PATH}" | sed 's|^/\([a-z]\)/|\U\1:/|')
    python -c "
import psycopg2
conn = psycopg2.connect(
    host='${DB_HOST}', port=${DB_PORT}, database='${DB_NAME}',
    user='${DB_USER}', password='${DB_PASSWORD}',
    sslmode='verify-full', sslrootcert=r'${WIN_CERT_PATH}'
)
conn.autocommit = True
cur = conn.cursor()
cur.execute('CREATE SCHEMA IF NOT EXISTS silver; CREATE SCHEMA IF NOT EXISTS gold;')
cur.close()
conn.close()
" 2>/dev/null
fi

echo -e "${GREEN}✓ Schemas ready${NC}"
echo ""

# ====================================
# Import data
# ====================================
SUCCESS=0
FAILED=0

if [ "$SYNC_SILVER" = true ]; then
    if run_sql_file "${SCRIPT_DIR}/silver_clean.sql" "SILVER"; then
        SUCCESS=$((SUCCESS + 1))
    else
        FAILED=$((FAILED + 1))
    fi
    echo ""
fi

if [ "$SYNC_GOLD" = true ]; then
    if run_sql_file "${SCRIPT_DIR}/gold_clean.sql" "GOLD"; then
        SUCCESS=$((SUCCESS + 1))
    else
        FAILED=$((FAILED + 1))
    fi
    echo ""
fi

# ====================================
# Verify
# ====================================
if [ "$DRY_RUN" = false ] && [ $FAILED -eq 0 ]; then
    echo -e "${YELLOW}========================================${NC}"
    echo -e "${YELLOW}  Verification${NC}"
    echo -e "${YELLOW}========================================${NC}"
    echo ""
    
    if [ "$SYNC_SILVER" = true ]; then
        verify_rds "silver"
        echo ""
    fi
    
    if [ "$SYNC_GOLD" = true ]; then
        verify_rds "gold"
        echo ""
    fi
fi

# ====================================
# Summary
# ====================================
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  Sync Summary${NC}"
echo -e "${GREEN}========================================${NC}"
echo "  Successful: ${SUCCESS}"
echo "  Failed: ${FAILED}"

if [ $FAILED -gt 0 ]; then
    echo -e "${RED}  ⚠ Some imports failed!${NC}"
    exit 1
else
    echo -e "${GREEN}  ✓ All imports completed successfully!${NC}"
fi