from checkov.common.models.enums import Severities
from checkov.terraform.checks.base_check import BaseCheck
from checkov.common.models.consts import CheckResult


class LambdaInVPC(BaseCheck):
    def __init__(self):
        name = "Ensure Lambda functions are deployed in a VPC"
        id = "CKV_AWSCC_155"
        supported_resources = ['awscc_lambda_function']
        categories = []
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources,
                         severity=Severities.LOW)

    def scan_resource_conf(self, conf):
        """
        Looks for Lambda functions that are deployed in a VPC:
        https://docs.aws.amazon.com/securityhub/latest/userguide/lambda-controls.html#lambda-3
        """
        # Check VPC configuration
        vpc_config = conf.get('vpc_config', [{}])[0]
        
        if isinstance(vpc_config, dict):
            subnet_ids = vpc_config.get('subnet_ids', [])
            security_group_ids = vpc_config.get('security_group_ids', [])
            
            # Function is in VPC if it has both subnet IDs and security group IDs
            if subnet_ids and security_group_ids and len(subnet_ids) > 0 and len(security_group_ids) > 0:
                return CheckResult.PASSED
        
        return CheckResult.FAILED


check = LambdaInVPC()
