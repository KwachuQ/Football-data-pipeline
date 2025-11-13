#!/usr/bin/env python3
"""
Test script for BronzeStorageManager - Safe testing without affecting production
"""
# filepath: etl/tests/test_storage.py

import os
import sys
import logging
from datetime import datetime, timezone

# Add etl module to path
from pathlib import Path

# Add project root to path
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))

from minio import Minio
from etl.bronze.storage import BronzeStorageManager, StorageResult

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

class TestBronzeStorage:
    """Safe testing for BronzeStorageManager"""
    
    def __init__(self):
        # Initialize MinIO client
        self.client = Minio(
            endpoint=os.getenv('MINIO_ENDPOINT', 'localhost:9000'),
            access_key=os.getenv('MINIO_ACCESS_KEY', 'minio'),
            secret_key=os.getenv('MINIO_SECRET_KEY', 'minio123'),
            secure=os.getenv('MINIO_SECURE', 'false').lower() == 'true'
        )
                
        # Use TEST bucket (not production 'bronze')
        self.test_bucket = "bronze-test"
        self.storage = BronzeStorageManager(self.client, bucket_name=self.test_bucket)
        
        logger.info(f"✅ Initialized test storage with bucket: {self.test_bucket}")
    
    def setup_test_environment(self):
        """Create test bucket if doesn't exist"""
        try:
            if not self.client.bucket_exists(self.test_bucket):
                self.client.make_bucket(self.test_bucket)
                logger.info(f"✅ Created test bucket: {self.test_bucket}")
            else:
                logger.info(f"ℹ️ Test bucket already exists: {self.test_bucket}")
        except Exception as e:
            logger.error(f"❌ Failed to create test bucket: {e}")
            raise
    
    def cleanup_test_environment(self):
        """Remove all test data (optional - keep for inspection)"""
        try:
            objects = self.client.list_objects(
                self.test_bucket, 
                recursive=True
            )
            
            deleted_count = 0
            for obj in objects:
                self.client.remove_object(self.test_bucket, obj.object_name)
                deleted_count += 1
            
            if deleted_count > 0:
                logger.info(f"🗑️ Cleaned up {deleted_count} test objects")
            
            # Optionally remove bucket
            # self.client.remove_bucket(self.test_bucket)
            # logger.info(f"🗑️ Removed test bucket: {self.test_bucket}")
            
        except Exception as e:
            logger.warning(f"⚠️ Cleanup warning: {e}")
    
    def test_basic_storage(self) -> bool:
        """Test 1: Basic storage functionality"""
        logger.info("\n" + "="*60)
        logger.info("TEST 1: Basic Storage")
        logger.info("="*60)
        
        try:
            # Sample match data (simplified)
            test_records = [
                {
                    "id": 12345,
                    "homeTeam": {"id": 1, "name": "Test Team A"},
                    "awayTeam": {"id": 2, "name": "Test Team B"},
                    "status": {"type": "finished"},
                    "startTimestamp": 1725235200
                },
                {
                    "id": 12346,
                    "homeTeam": {"id": 3, "name": "Test Team C"},
                    "awayTeam": {"id": 4, "name": "Test Team D"},
                    "status": {"type": "finished"},
                    "startTimestamp": 1725321600
                }
            ]
            
            # Test metadata
            test_metadata = {
                "batch_id": "test_batch_001",
                "ingestion_timestamp": datetime.now(timezone.utc).isoformat(),
                "source": "sofascore_api",
                "endpoint": "/test/endpoint",
                "request_params": {"test": True}
            }
            
            # Store batch
            result = self.storage.store_batch(
                data_type="matches",
                records=test_records,
                metadata=test_metadata,
                tournament_id=202,
                season_id=76477,
                match_date="2025-08-15",
                replace_partition=False
            )
            
            # Verify result
            assert result.success, "Storage operation should succeed"
            assert result.record_count == 2, f"Expected 2 records, got {result.record_count}"
            assert result.object_key is not None, "Object key should be set"
            assert result.manifest_key is not None, "Manifest key should be set"
            
            logger.info(f"✅ Stored {result.record_count} records")
            logger.info(f"   Object: {result.object_key}")
            logger.info(f"   Manifest: {result.manifest_key}")
            logger.info(f"   Size: {result.file_size_bytes} bytes")
            
            return True
            
        except Exception as e:
            logger.error(f"❌ Test failed: {e}")
            return False
    
    def test_partition_key_generation(self) -> bool:
        """Test 2: Partition key generation"""
        logger.info("\n" + "="*60)
        logger.info("TEST 2: Partition Key Generation")
        logger.info("="*60)
        
        try:
            partition_key = self.storage.generate_partition_key(
                tournament_id=202,
                season_id=76477,
                match_date="2025-08-15"
            )
            
            expected = "tournament_id=202/season_id=76477/date=2025-08-15"
            assert partition_key == expected, f"Expected {expected}, got {partition_key}"
            
            logger.info(f"✅ Partition key: {partition_key}")
            
            return True
            
        except Exception as e:
            logger.error(f"❌ Test failed: {e}")
            return False
    
    def test_object_key_generation(self) -> bool:
        """Test 3: Object key generation"""
        logger.info("\n" + "="*60)
        logger.info("TEST 3: Object Key Generation")
        logger.info("="*60)
        
        try:
            partition_key = "tournament_id=202/season_id=76477/date=2025-08-15"
            object_key = self.storage.generate_object_key(
                data_type="matches",
                partition_key=partition_key,
                batch_id="abc123"
            )
            
            expected = "matches/tournament_id=202/season_id=76477/date=2025-08-15/batch_abc123.ndjson"
            assert object_key == expected, f"Expected {expected}, got {object_key}"
            
            logger.info(f"✅ Object key: {object_key}")
            
            return True
            
        except Exception as e:
            logger.error(f"❌ Test failed: {e}")
            return False
    
    def test_ndjson_format(self) -> bool:
        """Test 4: NDJSON format generation"""
        logger.info("\n" + "="*60)
        logger.info("TEST 4: NDJSON Format")
        logger.info("="*60)
        
        try:
            test_records = [
                {"id": 1, "name": "Test A"},
                {"id": 2, "name": "Test B"}
            ]
            
            ndjson_data = self.storage.prepare_ndjson_data(test_records)
            
            # Verify format
            lines = ndjson_data.decode('utf-8').split('\n')
            assert len(lines) == 2, f"Expected 2 lines, got {len(lines)}"
            
            # Verify each line is valid JSON
            import json
            for i, line in enumerate(lines):
                parsed = json.loads(line)
                assert parsed['id'] == test_records[i]['id']
            
            logger.info(f"✅ NDJSON format correct: {len(lines)} lines, {len(ndjson_data)} bytes")
            
            return True
            
        except Exception as e:
            logger.error(f"❌ Test failed: {e}")
            return False
    
    def test_manifest_creation(self) -> bool:
        """Test 5: Manifest file creation"""
        logger.info("\n" + "="*60)
        logger.info("TEST 5: Manifest Creation")
        logger.info("="*60)
        
        try:
            manifest = self.storage.create_manifest(
                object_key="test/path/batch_123.ndjson",
                metadata={"batch_id": "123", "source": "test"},
                record_count=10,
                file_size=1024
            )
            
            # Verify required fields
            required_fields = ["object_key", "metadata", "record_count", 
                             "file_size_bytes", "created_at", "schema_version"]
            
            for field in required_fields:
                assert field in manifest, f"Missing field: {field}"
            
            assert manifest["record_count"] == 10
            assert manifest["file_size_bytes"] == 1024
            assert manifest["schema_version"] == "1.0"
            
            logger.info(f"✅ Manifest created with {len(manifest)} fields")
            
            return True
            
        except Exception as e:
            logger.error(f"❌ Test failed: {e}")
            return False
    
    def test_list_partitions(self) -> bool:
        """Test 6: List partitions"""
        logger.info("\n" + "="*60)
        logger.info("TEST 6: List Partitions")
        logger.info("="*60)
        
        try:
            # First, store some test data
            for i in range(3):
                test_records = [{"id": i, "test": True}]
                test_metadata = {
                    "batch_id": f"test_partition_{i}",
                    "ingestion_timestamp": datetime.now(timezone.utc).isoformat(),
                    "source": "test"
                }
                
                self.storage.store_batch(
                    data_type="matches",
                    records=test_records,
                    metadata=test_metadata,
                    tournament_id=202,
                    season_id=76477,
                    match_date=f"2025-08-{15+i:02d}"
                )
            
            # List partitions
            partitions = self.storage.list_partitions(
                data_type="matches",
                tournament_id=202
            )
            
            assert len(partitions) >= 3, f"Expected at least 3 partitions, got {len(partitions)}"
            
            logger.info(f"✅ Found {len(partitions)} partitions:")
            for partition in partitions[:5]:  # Show first 5
                logger.info(f"   - {partition}")
            
            return True
            
        except Exception as e:
            logger.error(f"❌ Test failed: {e}")
            return False
    
    def test_get_manifest(self) -> bool:
        """Test 7: Retrieve manifest"""
        logger.info("\n" + "="*60)
        logger.info("TEST 7: Get Manifest")
        logger.info("="*60)
        
        try:
            # Store a batch
            test_records = [{"id": 999, "test": True}]
            test_metadata = {
                "batch_id": "test_manifest_001",
                "ingestion_timestamp": datetime.now(timezone.utc).isoformat(),
                "source": "test"
            }
            
            result = self.storage.store_batch(
                data_type="matches",
                records=test_records,
                metadata=test_metadata,
                tournament_id=202,
                season_id=76477,
                match_date="2025-08-20"
            )
            
            # Retrieve manifest
            manifest = self.storage.get_batch_manifest(result.object_key)
            
            assert manifest is not None, "Manifest should exist"
            assert manifest["record_count"] == 1
            assert manifest["metadata"]["batch_id"] == "test_manifest_001"
            
            logger.info(f"✅ Retrieved manifest:")
            logger.info(f"   Records: {manifest['record_count']}")
            logger.info(f"   Batch ID: {manifest['metadata']['batch_id']}")
            
            return True
            
        except Exception as e:
            logger.error(f"❌ Test failed: {e}")
            return False
    
    def test_partition_stats(self) -> bool:
        """Test 8: Get partition statistics"""
        logger.info("\n" + "="*60)
        logger.info("TEST 8: Partition Statistics")
        logger.info("="*60)
        
        try:
            partition_key = "tournament_id=202/season_id=76477/date=2025-08-15"
            
            stats = self.storage.get_partition_stats(
                data_type="matches",
                partition_key=partition_key
            )
            
            assert "batch_count" in stats
            assert "total_records" in stats
            assert "total_size_mb" in stats
            
            logger.info(f"✅ Partition statistics:")
            logger.info(f"   Batches: {stats.get('batch_count', 0)}")
            logger.info(f"   Records: {stats.get('total_records', 0)}")
            logger.info(f"   Size: {stats.get('total_size_mb', 0)} MB")
            
            return True
            
        except Exception as e:
            logger.error(f"❌ Test failed: {e}")
            return False
    
    def test_partition_replacement(self) -> bool:
        """Test 9: Partition replacement"""
        logger.info("\n" + "="*60)
        logger.info("TEST 9: Partition Replacement")
        logger.info("="*60)
        
        try:
            # Store initial data
            test_records_v1 = [{"id": 1, "version": 1}]
            metadata_v1 = {
                "batch_id": "replace_test_v1",
                "ingestion_timestamp": datetime.now(timezone.utc).isoformat(),
                "source": "test"
            }
            
            result_v1 = self.storage.store_batch(
                data_type="matches",
                records=test_records_v1,
                metadata=metadata_v1,
                tournament_id=202,
                season_id=76477,
                match_date="2025-08-25"
            )
            
            logger.info(f"   Stored v1: {result_v1.object_key}")
            
            # Replace partition
            test_records_v2 = [{"id": 2, "version": 2}]
            metadata_v2 = {
                "batch_id": "replace_test_v2",
                "ingestion_timestamp": datetime.now(timezone.utc).isoformat(),
                "source": "test"
            }
            
            result_v2 = self.storage.store_batch(
                data_type="matches",
                records=test_records_v2,
                metadata=metadata_v2,
                tournament_id=202,
                season_id=76477,
                match_date="2025-08-25",
                replace_partition=True  # This should delete v1
            )
            
            logger.info(f"   Stored v2: {result_v2.object_key}")
            
            # Verify only v2 exists
            partition_key = "tournament_id=202/season_id=76477/date=2025-08-25"
            stats = self.storage.get_partition_stats("matches", partition_key)
            
            assert stats["batch_count"] == 1, f"Expected 1 batch, got {stats['batch_count']}"
            
            logger.info(f"✅ Partition replacement successful")
            logger.info(f"   Final batch count: {stats['batch_count']}")
            
            return True
            
        except Exception as e:
            logger.error(f"❌ Test failed: {e}")
            return False
    
    def test_backward_compatibility(self) -> bool:
        """Test 10: Backward compatibility with dict format"""
        logger.info("\n" + "="*60)
        logger.info("TEST 10: Backward Compatibility")
        logger.info("="*60)
        
        try:
            test_records = [{"id": 100, "test": True}]
            test_metadata = {
                "batch_id": "compat_test",
                "ingestion_timestamp": datetime.now(timezone.utc).isoformat(),
                "source": "test"
            }
            
            result = self.storage.store_batch(
                data_type="matches",
                records=test_records,
                metadata=test_metadata,
                tournament_id=202,
                season_id=76477,
                match_date="2025-08-30"
            )
            
            # Convert to dict (old format)
            result_dict = result.to_dict()
            
            # Verify old code can still access fields
            assert result_dict['success'] == True
            assert result_dict['object_key'] is not None
            assert result_dict['record_count'] == 1
            assert 'error' not in result_dict  # None values excluded
            
            logger.info(f"✅ Backward compatibility maintained")
            logger.info(f"   Dict keys: {list(result_dict.keys())}")
            
            return True
            
        except Exception as e:
            logger.error(f"❌ Test failed: {e}")
            return False
    
    def run_all_tests(self):
        """Run all tests and report results"""
        logger.info("\n" + "🧪"*30)
        logger.info("BRONZE STORAGE MANAGER - SAFE TEST SUITE")
        logger.info("🧪"*30)
        logger.info(f"Test bucket: {self.test_bucket}")
        logger.info(f"Production bucket (untouched): bronze")
        logger.info("="*60 + "\n")
        
        # Setup
        self.setup_test_environment()
        
        # Run tests
        tests = [
            ("Partition Key Generation", self.test_partition_key_generation),
            ("Object Key Generation", self.test_object_key_generation),
            ("NDJSON Format", self.test_ndjson_format),
            ("Manifest Creation", self.test_manifest_creation),
            ("Basic Storage", self.test_basic_storage),
            ("List Partitions", self.test_list_partitions),
            ("Get Manifest", self.test_get_manifest),
            ("Partition Statistics", self.test_partition_stats),
            ("Partition Replacement", self.test_partition_replacement),
            ("Backward Compatibility", self.test_backward_compatibility),
        ]
        
        results = {}
        for test_name, test_func in tests:
            try:
                results[test_name] = test_func()
            except Exception as e:
                logger.error(f"❌ {test_name} crashed: {e}")
                results[test_name] = False
        
        # Summary
        logger.info("\n" + "="*60)
        logger.info("TEST RESULTS SUMMARY")
        logger.info("="*60)
        
        passed = sum(1 for result in results.values() if result)
        total = len(results)
        
        for test_name, result in results.items():
            status = "✅ PASS" if result else "❌ FAIL"
            logger.info(f"{status} - {test_name}")
        
        logger.info("="*60)
        logger.info(f"Total: {passed}/{total} tests passed")
        
        if passed == total:
            logger.info("🎉 All tests passed!")
            logger.info("\n💡 Next steps:")
            logger.info("   1. Inspect test data in MinIO Console: http://localhost:9001")
            logger.info(f"   2. Browse bucket: {self.test_bucket}")
            logger.info("   3. If satisfied, update DAGs to use new storage manager")
        else:
            logger.error(f"💥 {total - passed} test(s) failed")
        
        logger.info("\n🗑️ Cleanup:")
        logger.info(f"   • Test data is in '{self.test_bucket}' bucket")
        logger.info("   • Production 'bronze' bucket is untouched")
        logger.info("   • Run cleanup_test_environment() to remove test data")
        
        return passed == total


def main():
    """Main test execution"""
    tester = TestBronzeStorage()
    
    try:
        success = tester.run_all_tests()
        
        # Optional: Ask before cleanup
        # cleanup = input("\nCleanup test data? (y/n): ")
        # if cleanup.lower() == 'y':
        #     tester.cleanup_test_environment()
        
        sys.exit(0 if success else 1)
        
    except KeyboardInterrupt:
        logger.info("\n⏸️ Tests interrupted by user")
        sys.exit(1)
    except Exception as e:
        logger.error(f"💥 Test suite failed: {e}", exc_info=True)
        sys.exit(1)


if __name__ == "__main__":
    main()