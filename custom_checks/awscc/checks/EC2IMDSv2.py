from checkov.common.models.enums import Severities
from checkov.terraform.checks.base_check import BaseCheck
from checkov.common.models.consts import CheckResult


class EC2IMDSv2(BaseCheck):
    def __init__(self):
        name = "Ensure EC2 instances use Instance Metadata Service Version 2 (IMDSv2)"
        id = "CKV_AWSCC_152"
        supported_resources = ['awscc_ec2_instance']
        categories = []
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources,
                         severity=Severities.HIGH)

    def scan_resource_conf(self, conf):
        """
        Looks for EC2 instances that enforce IMDSv2:
        https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-8
        """
        # Check metadata options
        metadata_options = conf.get('metadata_options', [{}])[0]
        
        if isinstance(metadata_options, dict):
            # Check if HTTP tokens are required (IMDSv2)
            http_tokens = metadata_options.get('http_tokens')
            if http_tokens == 'required':
                return CheckResult.PASSED
        
        return CheckResult.FAILED


check = EC2IMDSv2()
