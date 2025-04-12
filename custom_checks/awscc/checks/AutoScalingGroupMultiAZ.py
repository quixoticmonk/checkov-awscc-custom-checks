from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class AutoScalingGroupMultiAZ(BaseResourceCheck):
    def __init__(self):
        name = "Ensure Auto Scaling groups span multiple Availability Zones"
        id = "CKV_AWSCC_115"
        supported_resources = ["awscc_autoscaling_auto_scaling_group"]
        categories = [CheckCategories.BACKUP_AND_RECOVERY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if "availability_zones" in conf.keys():
            availability_zones = conf["availability_zones"]
            if isinstance(availability_zones, list) and len(availability_zones) > 1:
                return CheckResult.PASSED
        
        if "vpc_zone_identifier" in conf.keys():
            vpc_zone_identifiers = conf["vpc_zone_identifier"]
            if isinstance(vpc_zone_identifiers, list) and len(vpc_zone_identifiers) > 1:
                return CheckResult.PASSED
        
        return CheckResult.FAILED


check = AutoScalingGroupMultiAZ()
