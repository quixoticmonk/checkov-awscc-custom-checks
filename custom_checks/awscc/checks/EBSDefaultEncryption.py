from checkov.common.models.enums import Severities
from checkov.terraform.checks.base_check import BaseCheck
from checkov.common.models.consts import CheckResult


class EBSDefaultEncryption(BaseCheck):
    def __init__(self):
        name = "Ensure EBS default encryption is enabled"
        id = "CKV_AWSCC_151"
        supported_resources = ['awscc_ec2_ebs_encryption_by_default']
        categories = []
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources,
                         severity=Severities.HIGH)

    def scan_resource_conf(self, conf):
        """
        Looks for EBS default encryption configuration:
        https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-7
        """
        # Check if EBS encryption by default is enabled
        ebs_encryption_by_default = conf.get('ebs_encryption_by_default', [None])[0]
        
        if ebs_encryption_by_default is True:
            return CheckResult.PASSED
        
        return CheckResult.FAILED


check = EBSDefaultEncryption()
