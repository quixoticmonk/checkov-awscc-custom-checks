from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class CloudtrailEventDataStoreUsesCMK(BaseResourceCheck):
    def __init__(self):
        name = "Ensure CloudTrail Event Data Store uses CMK"
        id = "CKV_AWSCC_124"
        supported_resources = ["awscc_cloudtrail_event_data_store"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if kms_key_id is specified
        if "kms_key_id" in conf:
            if conf["kms_key_id"]:
                return CheckResult.PASSED
        return CheckResult.FAILED


check = CloudtrailEventDataStoreUsesCMK()
