from checkov.common.models.enums import Severities
from checkov.terraform.checks.base_check import BaseCheck
from checkov.common.models.consts import CheckResult


class S3BucketPublicReadAccess(BaseCheck):
    def __init__(self):
        name = "Ensure S3 buckets do not allow public read access"
        id = "CKV_AWSCC_153"
        supported_resources = ['awscc_s3_bucket']
        categories = []
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources,
                         severity=Severities.HIGH)

    def scan_resource_conf(self, conf):
        """
        Looks for S3 buckets that block public read access:
        https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-2
        """
        # Check public access block configuration
        public_access_block_configuration = conf.get('public_access_block_configuration', [{}])[0]
        
        if isinstance(public_access_block_configuration, dict):
            # Check if public read access is blocked
            block_public_acls = public_access_block_configuration.get('block_public_acls', False)
            ignore_public_acls = public_access_block_configuration.get('ignore_public_acls', False)
            block_public_policy = public_access_block_configuration.get('block_public_policy', False)
            restrict_public_buckets = public_access_block_configuration.get('restrict_public_buckets', False)
            
            # All four settings should be True to properly block public access
            if all([block_public_acls, ignore_public_acls, block_public_policy, restrict_public_buckets]):
                return CheckResult.PASSED
        
        return CheckResult.FAILED


check = S3BucketPublicReadAccess()
