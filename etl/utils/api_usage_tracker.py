import json
import logging
from datetime import datetime, timezone
from pathlib import Path
from typing import Optional, Dict, Any, List
from dataclasses import dataclass, asdict, field
import threading

logger = logging.getLogger(__name__)

@dataclass
class APICallRecord:
    "Single API call record"
    timestamp: str
    endpoint: str
    method: str
    status_code: int
    dag_id: Optional[str] = None
    task_id: Optional[str] = None

@dataclass
class APIUsageSummary:
    "Summary of API usage"
    total_requests: int = 0
    successful_requests: int = 0
    failed_requests: int = 0    
    rate_limited_requests: int = 0
    endpoints: Dict[str, int] = field(default_factory=dict)   

class APIUsageTracker:
    """Thread safe tracker for API usage"""

    _instance = None
    _lock = threading.Lock()

    def __new__(cls, *args, **kwargs):
        if cls._instance is None:
            with cls._lock:
                if cls._instance is None:
                    cls._instance = super().__new__(cls)
                    cls._instance._initialized = False

        return cls._instance
    
    def __init__(self):
        if self._initialized:
            return
        
        self.records: List[APICallRecord] = []
        self.summary = APIUsageSummary()
        self.log_file = Path("/opt/var/logs/api_usage.jsonl")
        self.log_file.parent.mkdir(parents=True, exist_ok=True)
        self._initialized = True

        logger.info(f"APIUsageTracker initialized, logging to: {self.log_file}")

    def track_request(
        self,
        endpoint: str,
        method: str,
        status_code: int,
        dag_id: Optional[str] = None,
        task_id: Optional[str] = None
    ):
        "Track single API request"

        with self._lock:
            record = APICallRecord(
                timestamp=datetime.now(timezone.utc).isoformat(),
                endpoint=endpoint,
                method=method,
                status_code=status_code,
                dag_id=dag_id,
                task_id=task_id
            )

            self.records.append(record)

            # Update summary
            self.summary.total_requests += 1

            if 200 <= status_code < 300:
                self.summary.successful_requests += 1
            elif status_code == 429:
                self.summary.rate_limited_requests += 1
            elif status_code >= 400:
                self.summary.failed_requests += 1

            # Track by endpoint
            if endpoint not in self.summary.endpoints:
                self.summary.endpoints[endpoint] = 0
            self.summary.endpoints[endpoint] += 1

            # Append to log file
            self._append_to_log(record)

    def _append_to_log(self, record: APICallRecord):
        "Append single record to log file"
        try:
            with self.log_file.open("a") as f:
                f.write(json.dumps(asdict(record)) + "\n")
        except Exception as e:
            logger.error(f"Failed to write API usage log: {e}")

    def get_summary(self) -> APIUsageSummary:
        "Get current API usage summary"
        with self._lock:
            return APIUsageSummary(
                total_requests=self.summary.total_requests,
                successful_requests=self.summary.successful_requests,
                failed_requests=self.summary.failed_requests,
                rate_limited_requests=self.summary.rate_limited_requests,
                endpoints=self.summary.endpoints.copy()
    )
        
    def get_summary_dict(self) -> Dict[str, Any]:
        "Get current API usage summary as dict"
        summary = self.get_summary()
        return{
            "total_requests": summary.total_requests,
            "successful_requests": summary.successful_requests,
            "failed_requests": summary.failed_requests,
            "rate_limited_requests": summary.rate_limited_requests,
            "success_rate": (
                f"{(summary.successful_requests / summary.total_requests * 100):.1f}%"
                if summary.total_requests > 0 else "0%"
            ),
            'top_endpoints': dict(sorted(summary.endpoints.items(), key=lambda item: item[1], reverse=True)[:10]
            )   
        }
    
    def reset(self):
        "Reset tracker data"
        with self._lock:
            self.records.clear()
            self.summary = APIUsageSummary()

    def print_report(self):
        "Print summary report to logger"
        summary_dict = self.get_summary_dict()
        print("\n" + "="*70)
        print("API USAGE REPORT")
        print("="*70)
        print(f"Total Requests:        {summary_dict['total_requests']:,}")
        print(f"Successful:            {summary_dict['successful_requests']:,}")
        print(f"Failed:                {summary_dict['failed_requests']:,}")
        print(f"Rate Limited:          {summary_dict['rate_limited_requests']:,}")
        print(f"Success Rate:          {summary_dict['success_rate']}")
        
        if summary_dict['top_endpoints']:
            print(f"\nTop Endpoints:")
            for endpoint, count in summary_dict['top_endpoints'].items():
                print(f"  • {endpoint}: {count:,} calls")
        
        print("="*70 + "\n")

# Global tracker instance
try:
    tracker = APIUsageTracker()
except Exception as e:
    logger.error(f"Failed to initialize tracker: {e}")
    tracker = None