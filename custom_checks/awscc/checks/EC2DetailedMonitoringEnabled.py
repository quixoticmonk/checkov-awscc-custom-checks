from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class EC2DetailedMonitoringEnabled(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that detailed monitoring is enabled for EC2 instances"
        id = "CKV_AWSCC_134"
        supported_resources = ["awscc_ec2_instance"]
        categories = [CheckCategories.MONITORING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if "monitoring" in conf:
            if conf["monitoring"] is True:
                return CheckResult.PASSED
            # If explicitly set to false
            return CheckResult.FAILED
        # Default is false if not specified
        return CheckResult.FAILED


check = EC2DetailedMonitoringEnabled()
