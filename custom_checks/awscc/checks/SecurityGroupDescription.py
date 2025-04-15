from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class SecurityGroupDescription(BaseResourceCheck):
    def __init__(self):
        name = "Ensure security groups have descriptions"
        id = "CKV_AWSCC_142"
        supported_resources = ["awscc_ec2_security_group"]
        categories = [CheckCategories.NETWORKING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if "group_description" in conf:
            return CheckResult.PASSED
        return CheckResult.FAILED


check = SecurityGroupDescription()
