from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class AutoScalingGroupELBHealthCheck(BaseResourceCheck):
    def __init__(self):
        name = "Ensure Auto Scaling groups have ELB health check enabled"
        id = "CKV_AWSCC_113"
        supported_resources = ["awscc_autoscaling_auto_scaling_group"]
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if "health_check_type" in conf.keys():
            if conf["health_check_type"] == "ELB":
                return CheckResult.PASSED
        return CheckResult.FAILED


check = AutoScalingGroupELBHealthCheck()
