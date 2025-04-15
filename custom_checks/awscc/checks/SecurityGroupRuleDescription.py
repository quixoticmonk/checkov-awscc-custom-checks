from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class SecurityGroupRuleDescription(BaseResourceCheck):
    def __init__(self):
        name = "Ensure security group rules have descriptions"
        id = "CKV_AWSCC_143"
        supported_resources = ["awscc_ec2_security_group_ingress", "awscc_ec2_security_group_egress"]
        categories = [CheckCategories.NETWORKING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if "description" in conf:
            return CheckResult.PASSED
        return CheckResult.FAILED


check = SecurityGroupRuleDescription()
