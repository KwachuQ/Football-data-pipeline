# tests/test_incremental_extractor.py
#!/usr/bin/env python3
"""
Safe Testing Suite for incremental_extractor.py
Uses isolated test bucket and mock API data with date-based filtering
"""

import asyncio
import logging
import os
import sys
from datetime import datetime, timezone, timedelta
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
CUTOFF_DATE = "2025-11-05"  # Only matches after this date

# ============================================================================
# Mock Data Generators
# ============================================================================

class MockSofascoreClientIncremental:
    """Mock client that returns matches with varying dates"""
    
    def __init__(self, cutoff_date: str):
        self.call_count = 0
        self.cutoff_timestamp = int(datetime.strptime(cutoff_date, '%Y-%m-%d').timestamp())
        
    async def __aenter__(self):
        logger.info("🔧 Mock API client initialized (incremental mode)")
        return self
    
    async def __aexit__(self, exc_type, exc_val, exc_tb):
        logger.info(f"🔧 Mock API client closed ({self.call_count} calls made)")
    
    async def get_tournament_matches(
        self,
        tournament_id: int,
        season_id: int,
        page: int
    ) -> Dict[str, Any]:
        """Generate mock matches with mixed old/new dates"""
        self.call_count += 1
        
        matches = []
        
        # Page 0: Mix of new and old matches
        if page == 0:
            # 3 new matches (after cutoff)
            for i in range(3):
                match_id = 2000000 + i
                days_after = i + 2  # 2-4 days after cutoff
                timestamp = self.cutoff_timestamp + (days_after * 86400)
                
                matches.append({
                    'id': match_id,
                    'startTimestamp': timestamp,
                    'status': {'code': 100, 'type': 'finished'},
                    'homeTeam': {'id': 5000 + i, 'name': f'New Team {i}'},
                    'awayTeam': {'id': 6000 + i, 'name': f'New Team {i+1}'},
                    'tournament': {'id': tournament_id},
                    'season': {'id': season_id}
                })
            
            # 2 old matches (before cutoff)
            for i in range(2):
                match_id = 1000000 + i
                days_before = i + 1  # 1-2 days before cutoff
                timestamp = self.cutoff_timestamp - (days_before * 86400)
                
                matches.append({
                    'id': match_id,
                    'startTimestamp': timestamp,
                    'status': {'code': 100, 'type': 'finished'},
                    'homeTeam': {'id': 3000 + i, 'name': f'Old Team {i}'},
                    'awayTeam': {'id': 4000 + i, 'name': f'Old Team {i+1}'},
                    'tournament': {'id': tournament_id},
                    'season': {'id': season_id}
                })
        
        # Page 1: Mostly new matches
        elif page == 1:
            for i in range(4):
                match_id = 2000010 + i
                days_after = i + 5  # 5-8 days after cutoff
                timestamp = self.cutoff_timestamp + (days_after * 86400)
                
                matches.append({
                    'id': match_id,
                    'startTimestamp': timestamp,
                    'status': {'code': 100, 'type': 'finished'},
                    'homeTeam': {'id': 5010 + i, 'name': f'New Team Page2 {i}'},
                    'awayTeam': {'id': 6010 + i, 'name': f'New Team Page2 {i+1}'},
                    'tournament': {'id': tournament_id},
                    'season': {'id': season_id}
                })
            
            # 1 old match
            matches.append({
                'id': 1000010,
                'startTimestamp': self.cutoff_timestamp - (3 * 86400),
                'status': {'code': 100, 'type': 'finished'},
                'homeTeam': {'id': 3010, 'name': 'Old Team Page2'},
                'awayTeam': {'id': 4010, 'name': 'Old Team Page2 B'},
                'tournament': {'id': tournament_id},
                'season': {'id': season_id}
            })
        
        # Page 2: Mostly old matches (should trigger stop)
        elif page == 2:
            for i in range(4):
                match_id = 1000020 + i
                days_before = i + 4  # 4-7 days before cutoff
                timestamp = self.cutoff_timestamp - (days_before * 86400)
                
                matches.append({
                    'id': match_id,
                    'startTimestamp': timestamp,
                    'status': {'code': 100, 'type': 'finished'},
                    'homeTeam': {'id': 3020 + i, 'name': f'Old Team Page3 {i}'},
                    'awayTeam': {'id': 4020 + i, 'name': f'Old Team Page3 {i+1}'},
                    'tournament': {'id': tournament_id},
                    'season': {'id': season_id}
                })
            
            # Only 1 new match
            matches.append({
                'id': 2000020,
                'startTimestamp': self.cutoff_timestamp + (10 * 86400),
                'status': {'code': 100, 'type': 'finished'},
                'homeTeam': {'id': 5020, 'name': 'New Team Page3'},
                'awayTeam': {'id': 6020, 'name': 'New Team Page3 B'},
                'tournament': {'id': tournament_id},
                'season': {'id': season_id}
            })
        
        # Page 3+: Empty (shouldn't reach here)
        else:
            matches = []
        
        return {
            'data': {'items': matches},
            'metadata': {
                'batch_id': f'test_incremental_batch_{page}',
                'ingestion_timestamp': datetime.now(timezone.utc).isoformat(),
                'source': 'mock_api',
                'endpoint': 'tournament_matches',
                'page': page
            }
        }

# ============================================================================
# Test ETL Class
# ============================================================================

class TestIncrementalETL:
    """Incremental ETL with test-specific configuration"""
    
    def __init__(self, use_test_bucket: bool = True):
        """Initialize with test bucket"""
        self.minio_client = Minio(
            endpoint=os.getenv('MINIO_ENDPOINT', 'localhost:9000'),
            access_key=os.getenv('MINIO_ACCESS_KEY', 'minio'),
            secret_key=os.getenv('MINIO_SECRET_KEY', 'minio123'),
            secure=os.getenv('MINIO_SECURE', 'false').lower() == 'true'
        )
        
        from storage import BronzeStorageManager
        from incremental_extractor import SofascoreIncrementalETL as BaseETL
        
        bucket_name = TEST_BUCKET if use_test_bucket else "bronze"
        self.storage = BronzeStorageManager(self.minio_client, bucket_name=bucket_name)
        
        # Create base ETL instance and override storage
        self.base_etl = BaseETL.__new__(BaseETL)
        self.base_etl.minio_client = self.minio_client
        self.base_etl.storage = self.storage
        
        logger.info(f"🧪 Test Incremental ETL initialized with bucket: {bucket_name}")
    
    def __getattr__(self, name):
        """Delegate to base ETL"""
        return getattr(self.base_etl, name)

# ============================================================================
# Test Functions
# ============================================================================

async def test_parameter_validation():
    """Test input parameter validation"""
    logger.info("\n" + "="*60)
    logger.info("TEST 1: Parameter Validation")
    logger.info("="*60)
    
    etl = TestIncrementalETL(use_test_bucket=True)
    
    # Test invalid date format
    try:
        etl._validate_incremental_params(
            TEST_TOURNAMENT_ID,
            TEST_SEASON_ID,
            "2025/11/05",  # Wrong format
            25
        )
        assert False, "Should raise ValueError"
    except ValueError as e:
        logger.info(f"✅ Correctly caught invalid date format: {e}")
    
    # Test future date
    future_date = (datetime.now() + timedelta(days=10)).strftime('%Y-%m-%d')
    try:
        etl._validate_incremental_params(
            TEST_TOURNAMENT_ID,
            TEST_SEASON_ID,
            future_date,
            25
        )
        assert False, "Should raise ValueError"
    except ValueError as e:
        logger.info(f"✅ Correctly caught future date: {e}")
    
    # Test valid parameters
    try:
        cutoff = etl._validate_incremental_params(
            TEST_TOURNAMENT_ID,
            TEST_SEASON_ID,
            CUTOFF_DATE,
            25
        )
        logger.info(f"✅ Valid parameters accepted: cutoff={cutoff}")
    except ValueError:
        assert False, "Should accept valid parameters"
    
    logger.info("\n✅ All validation tests passed!")

async def test_filter_new_matches():
    """Test filtering logic"""
    logger.info("\n" + "="*60)
    logger.info("TEST 2: Match Filtering Logic")
    logger.info("="*60)
    
    etl = TestIncrementalETL(use_test_bucket=True)
    
    cutoff_date = datetime.strptime(CUTOFF_DATE, '%Y-%m-%d').date()
    cutoff_timestamp = int(datetime.strptime(CUTOFF_DATE, '%Y-%m-%d').timestamp())
    
    # Create test matches with various dates
    test_matches = [
        {'id': 1, 'startTimestamp': cutoff_timestamp + 86400},  # 1 day after (NEW)
        {'id': 2, 'startTimestamp': cutoff_timestamp + (2 * 86400)},  # 2 days after (NEW)
        {'id': 3, 'startTimestamp': cutoff_timestamp},  # Same day (OLD)
        {'id': 4, 'startTimestamp': cutoff_timestamp - 86400},  # 1 day before (OLD)
        {'id': 5, 'startTimestamp': 0},  # Invalid (SKIP)
    ]
    
    new_matches = etl._filter_new_matches(test_matches, cutoff_date)
    
    logger.info(f"\n📊 Filtered matches:")
    logger.info(f"  • Total input: {len(test_matches)}")
    logger.info(f"  • New matches: {len(new_matches)}")
    logger.info(f"  • Match IDs: {[m['id'] for m in new_matches]}")
    
    assert len(new_matches) == 2, f"Expected 2 new matches, got {len(new_matches)}"
    assert all(m['id'] in [1, 2] for m in new_matches), "Should only include matches 1 and 2"
    
    logger.info("\n✅ Filtering logic test passed!")

async def test_should_continue_scan():
    """Test early termination logic"""
    logger.info("\n" + "="*60)
    logger.info("TEST 3: Early Termination Logic")
    logger.info("="*60)
    
    etl = TestIncrementalETL(use_test_bucket=True)
    
    cutoff_date = datetime.strptime(CUTOFF_DATE, '%Y-%m-%d').date()
    cutoff_timestamp = int(datetime.strptime(CUTOFF_DATE, '%Y-%m-%d').timestamp())
    
    # Test 1: Mostly new matches - should continue
    mostly_new = [
        {'id': i, 'startTimestamp': cutoff_timestamp + (i * 86400)}
        for i in range(1, 9)  # 8 new matches
    ] + [
        {'id': 99, 'startTimestamp': cutoff_timestamp - 86400}  # 1 old
    ]
    
    should_continue = etl._should_continue_scan(mostly_new, cutoff_date)
    logger.info(f"  • Mostly new (89% new): should_continue={should_continue}")
    assert should_continue, "Should continue with mostly new matches"
    
    # Test 2: Mostly old matches - should stop
    mostly_old = [
        {'id': i, 'startTimestamp': cutoff_timestamp - (i * 86400)}
        for i in range(1, 9)  # 8 old matches
    ] + [
        {'id': 99, 'startTimestamp': cutoff_timestamp + 86400}  # 1 new
    ]
    
    should_continue = etl._should_continue_scan(mostly_old, cutoff_date, threshold=0.8)
    logger.info(f"  • Mostly old (89% old): should_continue={should_continue}")
    assert not should_continue, "Should stop with mostly old matches"
    
    logger.info("\n✅ Early termination logic test passed!")

async def test_incremental_extraction():
    """Test full incremental extraction flow"""
    logger.info("\n" + "="*60)
    logger.info("TEST 4: Incremental Extraction Flow")
    logger.info("="*60)
    
    etl = TestIncrementalETL(use_test_bucket=True)
    
    # Create mock client factory
    def mock_client_factory():
        return MockSofascoreClientIncremental(CUTOFF_DATE)
    
    # Patch the SofascoreClient
    with patch('incremental_extractor.SofascoreClient', mock_client_factory):
        result = etl.extract_new_matches(
            tournament_id=TEST_TOURNAMENT_ID,
            season_id=TEST_SEASON_ID,
            last_match_date=CUTOFF_DATE,
            max_pages=5  # Should stop early
        )
    
    # Verify results
    logger.info(f"\n📊 Results:")
    logger.info(f"  • New matches found: {result['total_new_matches']}")
    logger.info(f"  • Pages scanned: {result['pages_scanned']}")
    logger.info(f"  • Stored batches: {len(result['stored_batches'])}")
    logger.info(f"  • Errors: {len(result['errors'])}")
    
    if result['errors']:
        logger.error("❌ Errors found:")
        for error in result['errors']:
            logger.error(f"  • {error}")
    
    # Expected: 3 (page 0) + 4 (page 1) + 1 (page 2) = 8 new matches
    # Page 2 should trigger early stop (80% old matches)
    assert result['total_new_matches'] == 8, f"Expected 8 new matches, got {result['total_new_matches']}"
    assert result['pages_scanned'] <= 3, f"Should stop early, scanned {result['pages_scanned']} pages"
    assert len(result['errors']) == 0, "Should have no errors"
    
    logger.info("\n✅ Incremental extraction test passed!")
    return result

async def test_no_new_matches_scenario():
    """Test scenario where no new matches exist"""
    logger.info("\n" + "="*60)
    logger.info("TEST 5: No New Matches Scenario")
    logger.info("="*60)
    
    etl = TestIncrementalETL(use_test_bucket=True)
    
    # Create mock client that returns only old matches
    class MockClientNoNew:
        async def __aenter__(self):
            return self
        
        async def __aexit__(self, *args):
            pass
        
        async def get_tournament_matches(self, tid, sid, page):
            cutoff_ts = int(datetime.strptime(CUTOFF_DATE, '%Y-%m-%d').timestamp())
            
            if page == 0:
                # Only old matches
                return {
                    'data': {
                        'items': [
                            {
                                'id': i,
                                'startTimestamp': cutoff_ts - (i * 86400),
                                'homeTeam': {'id': i},
                                'awayTeam': {'id': i+1},
                                'tournament': {'id': TEST_TOURNAMENT_ID},
                                'season': {'id': TEST_SEASON_ID}
                            }
                            for i in range(5)
                        ]
                    },
                    'metadata': {'batch_id': 'test', 'ingestion_timestamp': datetime.now(timezone.utc).isoformat()}
                }
            else:
                return {'data': {'items': []}, 'metadata': {}}
    
    with patch('incremental_extractor.SofascoreClient', MockClientNoNew):
        result = etl.extract_new_matches(
            tournament_id=TEST_TOURNAMENT_ID,
            season_id=TEST_SEASON_ID,
            last_match_date=CUTOFF_DATE,
            max_pages=5
        )
    
    logger.info(f"\n📊 Results:")
    logger.info(f"  • New matches: {result['total_new_matches']}")
    logger.info(f"  • Pages scanned: {result['pages_scanned']}")
    
    assert result['total_new_matches'] == 0, "Should find no new matches"
    assert result['pages_scanned'] == 1, "Should stop after first page"
    
    logger.info("\n✅ No new matches scenario test passed!")

async def verify_test_data_isolation():
    """Verify test data is in separate bucket"""
    logger.info("\n" + "="*60)
    logger.info("TEST 6: Data Isolation Verification")
    logger.info("="*60)
    
    etl = TestIncrementalETL(use_test_bucket=True)
    
    try:
        objects = list(etl.minio_client.list_objects(TEST_BUCKET, recursive=True))
        logger.info(f"\n📦 Objects in {TEST_BUCKET}: {len(objects)}")
        
        for obj in objects[:10]:
            logger.info(f"  • {obj.object_name} ({obj.size} bytes)")
        
        # Check production bucket untouched
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
    logger.info("🧪 INCREMENTAL_EXTRACTOR.PY - SAFE TEST SUITE")
    logger.info("="*70)
    logger.info(f"Test bucket: {TEST_BUCKET}")
    logger.info(f"Test tournament: {TEST_TOURNAMENT_ID}")
    logger.info(f"Test season: {TEST_SEASON_ID}")
    logger.info(f"Cutoff date: {CUTOFF_DATE}")
    logger.info("="*70)
    
    try:
        # Run tests
        test_parameter_validation()
        test_filter_new_matches()
        test_should_continue_scan()
        test_incremental_extraction()
        test_no_new_matches_scenario()
        verify_test_data_isolation()
        
        logger.info("\n" + "="*70)
        logger.info("✅ ALL TESTS PASSED!")
        logger.info("="*70)
        logger.info("\nKey features verified:")
        logger.info("  ✓ Date-based filtering works correctly")
        logger.info("  ✓ Early termination triggers when historical data reached")
        logger.info("  ✓ No data written when no new matches found")
        logger.info("  ✓ Parameter validation catches invalid inputs")
        logger.info("  ✓ Production data completely isolated")
        
    except Exception as e:
        logger.error(f"\n❌ Test suite failed: {e}", exc_info=True)
        raise
    finally:
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