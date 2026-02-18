#!/bin/bash

# Export Gold and Silver layer data from local DWH to SQL files
# Usage: ./export_dwh_to_sql.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${YELLOW}========================================${NC}"
echo -e "${YELLOW}  DWH Export to SQL Files${NC}"
echo -e "${YELLOW}========================================${NC}"
echo ""

# ========================================
# Step 1: Export Gold Layer
# ========================================
echo -e "${YELLOW}[1/4] Exporting gold schema structure...${NC}"

# Export gold schema - schema only (CREATE TABLE, indexes, etc.)
docker exec postgres pg_dump -U airflow -d dwh \
    --schema=gold \
    --schema-only \
    --no-owner \
    --no-privileges \
    --no-comments \
    --if-exists \
    --clean \
    > "${SCRIPT_DIR}/gold_clean_${TIMESTAMP}.sql.tmp"

echo -e "${GREEN}  ✓ Gold schema exported${NC}"

echo -e "${YELLOW}[2/4] Exporting gold data...${NC}"

# Export gold schema - data only (INSERT statements)
docker exec postgres pg_dump -U airflow -d dwh \
    --schema=gold \
    --data-only \
    --no-owner \
    --no-privileges \
    --column-inserts \
    --rows-per-insert=100 \
    >> "${SCRIPT_DIR}/gold_clean_${TIMESTAMP}.sql.tmp"

echo -e "${GREEN}  ✓ Gold data exported${NC}"

# ========================================
# Step 2: Export Silver Layer
# ========================================
echo -e "${YELLOW}[3/4] Exporting silver schema structure...${NC}"

docker exec postgres pg_dump -U airflow -d dwh \
    --schema=silver \
    --schema-only \
    --no-owner \
    --no-privileges \
    --no-comments \
    --if-exists \
    --clean \
    > "${SCRIPT_DIR}/silver_clean_${TIMESTAMP}.sql.tmp"

echo -e "${GREEN}  ✓ Silver schema exported${NC}"

echo -e "${YELLOW}[4/4] Exporting silver data...${NC}"

docker exec postgres pg_dump -U airflow -d dwh \
    --schema=silver \
    --data-only \
    --no-owner \
    --no-privileges \
    --column-inserts \
    --rows-per-insert=100 \
    >> "${SCRIPT_DIR}/silver_clean_${TIMESTAMP}.sql.tmp"

echo -e "${GREEN}  ✓ Silver data exported${NC}"

# ========================================
# Step 3: Clean up & finalize
# ========================================
echo ""
echo -e "${YELLOW}Finalizing exports...${NC}"

# Add transaction wrapper and SET statements for clean import
for layer in gold silver; do
    TMPFILE="${SCRIPT_DIR}/${layer}_clean_${TIMESTAMP}.sql.tmp"
    OUTFILE="${SCRIPT_DIR}/${layer}_clean.sql"
    
    # Backup old file if exists
    if [ -f "${OUTFILE}" ]; then
        cp "${OUTFILE}" "${SCRIPT_DIR}/${layer}_clean_backup_${TIMESTAMP}.sql"
        echo -e "  Backed up old ${layer}_clean.sql"
    fi
    
    # Create clean SQL file with proper header
    cat > "${OUTFILE}" << HEADER
--
-- ${layer^^} layer export from local DWH
-- Generated: $(date '+%Y-%m-%d %H:%M:%S')
-- Source: postgres container (dwh database)
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

BEGIN;

HEADER
    
    # Append the pg_dump output
    cat "${TMPFILE}" >> "${OUTFILE}"
    
    # Add COMMIT
    echo "" >> "${OUTFILE}"
    echo "COMMIT;" >> "${OUTFILE}"
    
    # Remove temp file
    rm -f "${TMPFILE}"
    
    # Show file stats
    LINE_COUNT=$(wc -l < "${OUTFILE}")
    FILE_SIZE=$(du -h "${OUTFILE}" | cut -f1)
    echo -e "${GREEN}  ✓ ${layer}_clean.sql: ${LINE_COUNT} lines, ${FILE_SIZE}${NC}"
done

# ========================================
# Step 4: Verify exported data
# ========================================
echo ""
echo -e "${YELLOW}Verifying export contents...${NC}"

echo -e "\n${GREEN}Gold tables exported:${NC}"
docker exec postgres psql -U airflow -d dwh -t -A -c "
    SELECT table_name, 
           (xpath('/row/cnt/text()', xml_count))[1]::text::int as row_count
    FROM (
        SELECT table_name, 
               query_to_xml('SELECT COUNT(*) as cnt FROM gold.' || table_name, false, true, '') as xml_count
        FROM information_schema.tables 
        WHERE table_schema = 'gold' 
        AND table_type IN ('BASE TABLE', 'VIEW')
        ORDER BY table_name
    ) t;" 2>/dev/null || \
docker exec postgres psql -U airflow -d dwh -c "
    SELECT table_name, table_type
    FROM information_schema.tables 
    WHERE table_schema = 'gold'
    ORDER BY table_name;"

echo -e "\n${GREEN}Silver tables exported:${NC}"
docker exec postgres psql -U airflow -d dwh -t -A -c "
    SELECT table_name, 
           (xpath('/row/cnt/text()', xml_count))[1]::text::int as row_count
    FROM (
        SELECT table_name, 
               query_to_xml('SELECT COUNT(*) as cnt FROM silver.' || table_name, false, true, '') as xml_count
        FROM information_schema.tables 
        WHERE table_schema = 'silver' 
        AND table_type = 'BASE TABLE'
        ORDER BY table_name
    ) t;" 2>/dev/null || \
docker exec postgres psql -U airflow -d dwh -c "
    SELECT table_name, table_type
    FROM information_schema.tables 
    WHERE table_schema = 'silver'
    ORDER BY table_name;"

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  Export complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "Files ready for AWS RDS import:"
echo "  ${SCRIPT_DIR}/gold_clean.sql"
echo "  ${SCRIPT_DIR}/silver_clean.sql"
echo ""
echo "Next step: ./sync_to_rds.sh"