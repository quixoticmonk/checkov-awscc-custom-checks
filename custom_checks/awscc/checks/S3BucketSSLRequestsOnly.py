from checkov.common.models.enums import Severities
from checkov.terraform.checks.base_check import BaseCheck
from checkov.common.models.consts import CheckResult
import json


class S3BucketSSLRequestsOnly(BaseCheck):
    def __init__(self):
        name = "Ensure S3 buckets require requests to use SSL"
        id = "CKV_AWSCC_154"
        supported_resources = ['awscc_s3_bucket']
        categories = []
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources,
                         severity=Severities.HIGH)

    def scan_resource_conf(self, conf):
        """
        Looks for S3 buckets that require SSL for requests:
        https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-5
        """
        # Check bucket policy for SSL enforcement
        bucket_policy = conf.get('bucket_policy', [None])[0]
        
        if bucket_policy:
            try:
                if isinstance(bucket_policy, str):
                    policy = json.loads(bucket_policy)
                else:
                    policy = bucket_policy
                
                # Look for deny statements that enforce SSL
                statements = policy.get('Statement', [])
                for statement in statements:
                    if (statement.get('Effect') == 'Deny' and 
                        'aws:SecureTransport' in statement.get('Condition', {}).get('Bool', {})):
                        secure_transport = statement['Condition']['Bool']['aws:SecureTransport']
                        if secure_transport == 'false' or secure_transport is False:
                            return CheckResult.PASSED
            except (json.JSONDecodeError, TypeError, KeyError):
                pass
        
        return CheckResult.FAILED


check = S3BucketSSLRequestsOnly()
