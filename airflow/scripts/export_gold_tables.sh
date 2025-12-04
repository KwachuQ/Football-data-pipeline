#!/usr/bin/env bash

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT_DIR="../../data"

mkdir -p "${OUTPUT_DIR}"

echo "Exporting Gold layer tables to CSV..."
echo "Output directory: ${OUTPUT_DIR}"
echo "Timestamp: ${TIMESTAMP}"
echo ""

# Get list of all tables into an array
mapfile -t TABLES < <(docker exec postgres psql -U airflow -d dwh -t -A -c "
    SELECT table_name 
    FROM information_schema.tables 
    WHERE table_schema = 'gold' 
    AND table_type = 'BASE TABLE'
    ORDER BY table_name;
" | tr -d '\r' | grep -v '^$')

echo "Found ${#TABLES[@]} tables:"
printf '%s\n' "${TABLES[@]}" | nl
echo ""
echo "DEBUG: Starting loop..."

SUCCESS_COUNT=0
FAIL_COUNT=0

# Export each table
for i in "${!TABLES[@]}"; do
    TABLE="${TABLES[$i]}"
    echo "DEBUG: Processing table $((i+1))/${#TABLES[@]}: '$TABLE'"
    
    if [ -n "$TABLE" ]; then
        OUTPUT_FILE="${OUTPUT_DIR}/${TABLE}_${TIMESTAMP}.csv"
        
        echo "Exporting: gold.${TABLE}..."
        
        docker exec postgres psql -U airflow -d dwh -c "\COPY (SELECT * FROM gold.${TABLE}) TO STDOUT WITH CSV HEADER" > "${OUTPUT_FILE}" 2>&1
        EXIT_CODE=$?
        
        echo "DEBUG: Exit code: $EXIT_CODE"
        
        if [ $EXIT_CODE -eq 0 ]; then
            ROW_COUNT=$(tail -n +2 "${OUTPUT_FILE}" | wc -l)
            echo "   ✓ Success! Rows: ${ROW_COUNT}"
            echo "   File: ${OUTPUT_FILE}"
            ((SUCCESS_COUNT++))
        else
            echo "   ✗ Failed to export ${TABLE} (exit code: $EXIT_CODE)"
            ((FAIL_COUNT++))
            rm -f "${OUTPUT_FILE}"
        fi
        echo ""
    fi
done

echo "DEBUG: Loop completed"
echo ""
echo "========================================"
echo "Export Summary"
echo "========================================"
echo "Successfully exported: ${SUCCESS_COUNT} table(s)"
echo "Failed exports: ${FAIL_COUNT} table(s)"
echo "Output directory: ${OUTPUT_DIR}"
echo "========================================"