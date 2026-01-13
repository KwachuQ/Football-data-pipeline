#!/bin/bash

# AWS RDS Connection Script
# Usage: ./connect_rds.sh [query]

set -e  # Exit on error

# ====================================
# Configuration
# ====================================
DB_HOST="football-data-db.cdagem22a9jh.eu-north-1.rds.amazonaws.com"
DB_PORT="5432"
DB_NAME="dwh"
DB_USER="airflow"
DB_PASSWORD="hwp3!45LV^hhceHQhv^JB2"

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ====================================
# Disable path conversion for Windows Git Bash
# ====================================
export MSYS_NO_PATHCONV=1

# ====================================
# Connection string
# ====================================
CONN_STR="host=${DB_HOST} port=${DB_PORT} dbname=${DB_NAME} user=${DB_USER} password=${DB_PASSWORD} sslmode=require"

# ====================================
# Functions
# ====================================

test_connection() {
    echo -e "${YELLOW}Testing connection to AWS RDS...${NC}"
    
    if docker exec -i postgres psql "${CONN_STR}" -c "SELECT 1;" > /dev/null 2>&1; then
        echo -e "${GREEN}✅ Connection successful!${NC}"
        
        # Show connection details
        docker exec -i postgres psql "${CONN_STR}" -c "\conninfo"
        
        return 0
    else
        echo -e "${RED}❌ Connection failed!${NC}"
        return 1
    fi
}

interactive_mode() {
    echo -e "${GREEN}Starting interactive session...${NC}"
    echo "Type SQL queries or PostgreSQL commands (\\q to quit)"
    echo "---------------------------------------------------"
    
    docker exec -it postgres psql "${CONN_STR}"
}

run_query() {
    local query="$1"
    echo -e "${YELLOW}Running query:${NC} ${query}"
    echo "---------------------------------------------------"
    
    docker exec -i postgres psql "${CONN_STR}" -c "${query}"
}

show_help() {
    cat << HELP
AWS RDS Connection Script

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
HELP
}

# ====================================
# Main
# ====================================

# Check if Docker is running
if ! docker ps > /dev/null 2>&1; then
    echo -e "${RED}❌ Docker is not running. Please start Docker Desktop.${NC}"
    exit 1
fi

# Check if postgres container exists
if ! docker ps --filter "name=postgres" --format "{{.Names}}" | grep -q "postgres"; then
    echo -e "${RED}❌ PostgreSQL container 'postgres' not found.${NC}"
    echo "Available containers:"
    docker ps --format "{{.Names}}"
    exit 1
fi

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
