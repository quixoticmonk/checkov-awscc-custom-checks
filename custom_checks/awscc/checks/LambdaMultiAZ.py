from checkov.common.models.enums import Severities
from checkov.terraform.checks.base_check import BaseCheck
from checkov.common.models.consts import CheckResult


class LambdaMultiAZ(BaseCheck):
    def __init__(self):
        name = "Ensure VPC Lambda functions operate in multiple Availability Zones"
        id = "CKV_AWSCC_156"
        supported_resources = ['awscc_lambda_function']
        categories = []
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources,
                         severity=Severities.MEDIUM)

    def scan_resource_conf(self, conf):
        """
        Looks for Lambda functions that operate in multiple AZs:
        https://docs.aws.amazon.com/securityhub/latest/userguide/lambda-controls.html#lambda-5
        """
        # Check VPC configuration
        vpc_config = conf.get('vpc_config', [{}])[0]
        
        if isinstance(vpc_config, dict):
            subnet_ids = vpc_config.get('subnet_ids', [])
            
            # Function should have at least 2 subnets for multi-AZ deployment
            if isinstance(subnet_ids, list) and len(subnet_ids) >= 2:
                return CheckResult.PASSED
            elif not subnet_ids:
                # If not in VPC, this check doesn't apply
                return CheckResult.PASSED
        
        return CheckResult.FAILED


check = LambdaMultiAZ()
