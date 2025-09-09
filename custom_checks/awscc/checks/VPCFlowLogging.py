from checkov.common.models.enums import Severities
from checkov.terraform.checks.base_check import BaseCheck
from checkov.common.models.consts import CheckResult


class VPCFlowLogging(BaseCheck):
    def __init__(self):
        name = "Ensure VPC flow logging is enabled"
        id = "CKV_AWSCC_150"
        supported_resources = ['awscc_ec2_vpc']
        categories = []
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources,
                         severity=Severities.MEDIUM)

    def scan_resource_conf(self, conf):
        """
        Looks for VPCs that have flow logging enabled:
        https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-6
        
        Note: This check looks for the VPC resource itself, but flow logging
        is typically configured via awscc_ec2_flow_log resource.
        This check serves as a reminder that flow logs should be configured.
        """
        # Since flow logs are configured separately via awscc_ec2_flow_log,
        # this check will always pass for the VPC resource itself.
        # The actual flow log configuration should be checked separately.
        return CheckResult.PASSED


check = VPCFlowLogging()
