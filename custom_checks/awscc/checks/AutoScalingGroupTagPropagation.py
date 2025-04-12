from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class AutoScalingGroupTagPropagation(BaseResourceCheck):
    def __init__(self):
        name = "Ensure Auto Scaling groups propagate tags to EC2 instances"
        id = "CKV_AWSCC_116"
        supported_resources = ["awscc_autoscaling_auto_scaling_group"]
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if "tags" in conf.keys() and isinstance(conf["tags"], list):
            for tag in conf["tags"]:
                if isinstance(tag, dict) and "propagate_at_launch" in tag and tag["propagate_at_launch"] is True:
                    return CheckResult.PASSED
        return CheckResult.FAILED


check = AutoScalingGroupTagPropagation()
