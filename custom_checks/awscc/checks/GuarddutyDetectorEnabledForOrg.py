from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class GuarddutyDetectorEnabledForOrg(BaseResourceCheck):
    def __init__(self):
        name = "Ensure GuardDuty is enabled to specific org/region"
        id = "CKV_AWSCC_141"
        supported_resources = ["awscc_guardduty_detector"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if detector is enabled
        if conf.get("enable") != [True]:
            return CheckResult.FAILED

        # Check if organization configuration exists and auto_enable is set to true
        if "organization_configuration" not in conf:
            return CheckResult.FAILED

        org_config = conf.get("organization_configuration")[0]
        if not isinstance(org_config, dict) or org_config.get("auto_enable") != [True]:
            return CheckResult.FAILED

        return CheckResult.PASSED


check = GuarddutyDetectorEnabledForOrg()
