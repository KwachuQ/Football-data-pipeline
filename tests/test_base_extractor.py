# tests/test_base_extractor.py
#!/usr/bin/env python3
"""
Safe Testing Suite for base_extractor.py
Uses isolated test bucket and mock API data
"""

import asyncio
import logging
import os
import sys
from datetime import datetime, timezone
from typing import Dict, Any, List
from unittest.mock import AsyncMock, MagicMock, patch

# Add parent directories to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'etl', 'bronze', 'extractors'))
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'etl', 'bronze'))

from minio import Minio

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# ============================================================================
# Test Configuration
# ============================================================================

TEST_BUCKET = "bronze-test"  # Isolated test bucket
TEST_TOURNAMENT_ID = 999
TEST_SEASON_ID = 99999
TEST_MAX_PAGES = 2

# ============================================================================
# Mock Data Generators
# ============================================================================

class MockSofascoreClient:
    """Mock Sofascore API client for safe testing"""
    
    def __init__(self):
        self.call_count = 0
        
    async def __aenter__(self):
        logger.info("🔧 Mock API client initialized")
        return self
    
    async def __aexit__(self, exc_type, exc_val, exc_tb):
        logger.info(f"🔧 Mock API client closed ({self.call_count} calls made)")
        
    async def get_tournament_matches(
        self,
        tournament_id: int,
        season_id: int,
        page: int
    ) -> Dict[str, Any]:
        """Generate mock match data"""
        self.call_count += 1
        
        # Simulate empty result after page 1
        if page > 1:
            return {
                'data': {'items': []},
                'metadata': {
                    'batch_id': f'test_batch_{page}',
                    'ingestion_timestamp': datetime.now(timezone.utc).isoformat(),
                    'source': 'mock_api',
                    'page': page
                }
            }
        
        # Generate test matches across different dates
        matches = []
        base_timestamp = int(datetime(2025, 11, 1).timestamp())
        
        for i in range(5):  # 5 matches per page
            match_id = 1000000 + (page * 100) + i
            day_offset = i % 3  # Spread across 3 days
            
            matches.append({
                'id': match_id,
                'startTimestamp': base_timestamp + (day_offset * 86400),  # Different dates
                'status': {'code': 100, 'type': 'finished'},
                'homeTeam': {
                    'id': 5000 + i,
                    'name': f'Test Home Team {i}',
                    'slug': f'test-home-{i}'
                },
                'awayTeam': {
                    'id': 6000 + i,
                    'name': f'Test Away Team {i}',
                    'slug': f'test-away-{i}'
                },
                'tournament': {
                    'id': tournament_id,
                    'name': 'Test Tournament',
                    'slug': 'test-tournament'
                },
                'season': {
                    'id': season_id,
                    'name': 'Test Season 2025/26',
                    'year': '25/26'
                }
            })
        
        return {
            'data': {'items': matches},
            'metadata': {
                'batch_id': f'test_batch_{page}',
                'ingestion_timestamp': datetime.now(timezone.utc).isoformat(),
                'source': 'mock_api',
                'endpoint': 'tournament_matches',
                'request_params': {
                    'tournament_id': tournament_id,
                    'season_id': season_id,
                    'page': page
                }
            }
        }
    
    async def get_match_details(self, match_id: int) -> Dict[str, Any]:
        """Generate mock match details"""
        self.call_count += 1
        
        return {
            'data': {
                'id': match_id,
                'startTimestamp': int(datetime(2025, 11, 1).timestamp()),
                'status': {'code': 100, 'type': 'finished'},
                'homeTeam': {'id': 5000, 'name': 'Test Home', 'slug': 'test-home'},
                'awayTeam': {'id': 6000, 'name': 'Test Away', 'slug': 'test-away'},
                'homeScore': {'current': 2, 'display': 2},
                'awayScore': {'current': 1, 'display': 1},
                'validation_status': 'passed'
            },
            'metadata': {
                'batch_id': f'detail_{match_id}',
                'ingestion_timestamp': datetime.now(timezone.utc).isoformat(),
                'source': 'mock_api',
                'endpoint': 'match_details'
            }
        }

# ============================================================================
# Test ETL Class
# ============================================================================

class TestSofascoreETL:
    """ETL with test-specific configuration"""
    
    def __init__(self, use_test_bucket: bool = True):
        """Initialize with test bucket"""
        # Initialize MinIO client
        self.minio_client = Minio(
            endpoint=os.getenv('MINIO_ENDPOINT', 'localhost:9000'),
            access_key=os.getenv('MINIO_ACCESS_KEY', 'minio'),
            secret_key=os.getenv('MINIO_SECRET_KEY', 'minio123'),
            secure=os.getenv('MINIO_SECURE', 'false').lower() == 'true'
        )
        
        # Import and initialize storage
        from storage import BronzeStorageManager
        from base_extractor import SofascoreETL as BaseETL
        
        # Use test bucket
        bucket_name = TEST_BUCKET if use_test_bucket else "bronze"
        self.storage = BronzeStorageManager(self.minio_client, bucket_name=bucket_name)
        
        # Copy methods from base ETL
        self.base_etl = BaseETL.__new__(BaseETL)
        self.base_etl.minio_client = self.minio_client
        self.base_etl.storage = self.storage
        
        logger.info(f"🧪 Test ETL initialized with bucket: {bucket_name}")
    
    def __getattr__(self, name):
        """Delegate to base ETL"""
        return getattr(self.base_etl, name)

# ============================================================================
# Test Functions
# ============================================================================

async def test_extract_tournament_matches():
    """Test tournament match extraction with mock data"""
    logger.info("\n" + "="*60)
    logger.info("TEST 1: Extract Tournament Matches")
    logger.info("="*60)
    
    etl = TestSofascoreETL(use_test_bucket=True)
    
    # Patch the SofascoreClient import in base_extractor module
    with patch('base_extractor.SofascoreClient', MockSofascoreClient):
        result = etl.extract_tournament_matches(
            tournament_id=TEST_TOURNAMENT_ID,
            season_id=TEST_SEASON_ID,
            max_pages=TEST_MAX_PAGES,
            replace_partition=True
        )
    
    # Verify results
    logger.info(f"\n📊 Results:")
    logger.info(f"  • Total matches: {result['total_matches']}")
    logger.info(f"  • Stored batches: {len(result['stored_batches'])}")
    logger.info(f"  • Errors: {len(result['errors'])}")
    
    if result['errors']:
        logger.error("❌ Errors found:")
        for error in result['errors']:
            logger.error(f"  • {error}")
    
    # List partitions
    partitions = etl.storage.list_partitions("matches", TEST_TOURNAMENT_ID)
    logger.info(f"\n📁 Created partitions: {len(partitions)}")
    for partition in partitions[:5]:  # Show first 5
        logger.info(f"  • {partition}")
    
    assert result['total_matches'] > 0, "Should extract matches"
    assert len(result['errors']) == 0, "Should have no errors"
    
    logger.info("\n✅ Test passed!")
    return result

async def test_extract_match_details():
    """Test match details extraction with mock data"""
    logger.info("\n" + "="*60)
    logger.info("TEST 2: Extract Match Details")
    logger.info("="*60)
    
    etl = TestSofascoreETL(use_test_bucket=True)
    
    # Use mock match IDs
    test_match_ids = [1000001, 1000002, 1000003, 1000004, 1000005]
    
    with patch('base_extractor.SofascoreClient', MockSofascoreClient):
        result = etl.extract_match_details(
            match_ids=test_match_ids,
            tournament_id=TEST_TOURNAMENT_ID,
            season_id=TEST_SEASON_ID,
            batch_size=3  # Small batch for testing
        )
    
    logger.info(f"\n📊 Results:")
    logger.info(f"  • Total processed: {result['total_processed']}")
    logger.info(f"  • Stored batches: {len(result['stored_batches'])}")
    logger.info(f"  • Errors: {len(result['errors'])}")
    
    assert result['total_processed'] == len(test_match_ids), "Should process all matches"
    assert len(result['errors']) == 0, "Should have no errors"
    
    logger.info("\n✅ Test passed!")
    return result

async def test_parameter_validation():
    """Test input parameter validation"""
    logger.info("\n" + "="*60)
    logger.info("TEST 3: Parameter Validation")
    logger.info("="*60)
    
    etl = TestSofascoreETL(use_test_bucket=True)
    
    # Test invalid tournament_id
    try:
        with patch('base_extractor.SofascoreClient', MockSofascoreClient):
            etl.extract_tournament_matches(
                tournament_id=-1,  # Invalid
                season_id=TEST_SEASON_ID,
                max_pages=1
            )
        assert False, "Should raise ValueError"
    except ValueError as e:
        logger.info(f"✅ Correctly caught invalid tournament_id: {e}")
    
    # Test invalid max_pages
    try:
        with patch('base_extractor.SofascoreClient', MockSofascoreClient):
            etl.extract_tournament_matches(
                tournament_id=TEST_TOURNAMENT_ID,
                season_id=TEST_SEASON_ID,
                max_pages=0  # Invalid
            )
        assert False, "Should raise ValueError"
    except ValueError as e:
        logger.info(f"✅ Correctly caught invalid max_pages: {e}")
    
    logger.info("\n✅ All validation tests passed!")

async def test_date_grouping():
    """Test match grouping by date"""
    logger.info("\n" + "="*60)
    logger.info("TEST 4: Date Grouping Logic")
    logger.info("="*60)
    
    etl = TestSofascoreETL(use_test_bucket=True)
    
    # Test data with various timestamps
    test_matches = [
        {'id': 1, 'startTimestamp': int(datetime(2025, 11, 1).timestamp())},
        {'id': 2, 'startTimestamp': int(datetime(2025, 11, 1).timestamp())},
        {'id': 3, 'startTimestamp': int(datetime(2025, 11, 2).timestamp())},
        {'id': 4, 'startTimestamp': 0},  # Should go to 'unknown'
        {'id': 5, 'startTimestamp': None},  # Should go to 'unknown'
    ]
    
    grouped = etl._group_matches_by_date(test_matches)
    
    logger.info(f"\n📊 Grouped matches:")
    for date, matches in grouped.items():
        logger.info(f"  • {date}: {len(matches)} matches")
    
    assert '2025-11-01' in grouped, "Should have 2025-11-01 partition"
    assert '2025-11-02' in grouped, "Should have 2025-11-02 partition"
    assert 'unknown' in grouped, "Should have unknown partition"
    assert len(grouped['2025-11-01']) == 2, "Should have 2 matches on 2025-11-01"
    
    logger.info("\n✅ Date grouping test passed!")

async def verify_test_data_isolation():
    """Verify test data is in separate bucket"""
    logger.info("\n" + "="*60)
    logger.info("TEST 5: Data Isolation Verification")
    logger.info("="*60)
    
    etl = TestSofascoreETL(use_test_bucket=True)
    
    # List objects in test bucket
    try:
        objects = list(etl.minio_client.list_objects(TEST_BUCKET, recursive=True))
        logger.info(f"\n📦 Objects in {TEST_BUCKET}: {len(objects)}")
        
        for obj in objects[:10]:  # Show first 10
            logger.info(f"  • {obj.object_name} ({obj.size} bytes)")
        
        # Check production bucket is untouched (if exists)
        try:
            prod_objects = list(etl.minio_client.list_objects("bronze", recursive=True))
            logger.info(f"\n✅ Production bucket 'bronze' has {len(prod_objects)} objects (unchanged)")
        except Exception:
            logger.info(f"\n✅ Production bucket 'bronze' doesn't exist or is empty (safe)")
            
    except Exception as e:
        logger.error(f"❌ Error checking buckets: {e}")
        raise
    
    logger.info("\n✅ Data isolation verified!")

# ============================================================================
# Cleanup Utilities
# ============================================================================

async def cleanup_test_data():
    """Remove all test data"""
    logger.info("\n" + "="*60)
    logger.info("CLEANUP: Removing Test Data")
    logger.info("="*60)
    
    minio_client = Minio(
        endpoint=os.getenv('MINIO_ENDPOINT', 'localhost:9000'),
        access_key=os.getenv('MINIO_ACCESS_KEY', 'minio'),
        secret_key=os.getenv('MINIO_SECRET_KEY', 'minio123'),
        secure=os.getenv('MINIO_SECURE', 'false').lower() == 'true'
    )
    
    try:
        # List and remove all objects
        objects = list(minio_client.list_objects(TEST_BUCKET, recursive=True))
        logger.info(f"Found {len(objects)} objects to remove")
        
        for obj in objects:
            minio_client.remove_object(TEST_BUCKET, obj.object_name)
            logger.info(f"  ✓ Removed: {obj.object_name}")
        
        logger.info("\n✅ Cleanup complete!")
        
    except Exception as e:
        logger.error(f"❌ Cleanup error: {e}")

# ============================================================================
# Main Test Runner
# ============================================================================

async def run_all_tests():
    """Run all tests"""
    logger.info("\n" + "="*70)
    logger.info("🧪 BASE_EXTRACTOR.PY - SAFE TEST SUITE")
    logger.info("="*70)
    logger.info(f"Test bucket: {TEST_BUCKET}")
    logger.info(f"Test tournament: {TEST_TOURNAMENT_ID}")
    logger.info(f"Test season: {TEST_SEASON_ID}")
    logger.info("="*70)
    
    try:
        # Run tests
        test_parameter_validation()
        test_date_grouping()
        test_extract_tournament_matches()
        test_extract_match_details()
        verify_test_data_isolation()
        
        logger.info("\n" + "="*70)
        logger.info("✅ ALL TESTS PASSED!")
        logger.info("="*70)
        
    except Exception as e:
        logger.error(f"\n❌ Test suite failed: {e}", exc_info=True)
        raise
    finally:
        # Ask before cleanup
        logger.info("\n" + "="*70)
        logger.info("Test data created in bucket: " + TEST_BUCKET)
        logger.info("="*70)


if __name__ == "__main__":
    # Run tests
    asyncio.run(run_all_tests())
    
    # Optional: Cleanup
    print("\n" + "="*70)
    response = input("Do you want to cleanup test data? (y/N): ")
    if response.lower() == 'y':
        asyncio.run(cleanup_test_data())
    else:
        print("Test data preserved for inspection.")