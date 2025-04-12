from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class ComprehendDocumentClassifierVolumeUsesCMK(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that Comprehend Document Classifier's volume is encrypted by KMS using a customer managed Key (CMK)"
        id = "CKV_AWSCC_128"
        supported_resources = ["awscc_comprehend_document_classifier"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if volume_kms_key_id is specified
        if "volume_kms_key_id" in conf:
            if conf["volume_kms_key_id"]:
                return CheckResult.PASSED
        return CheckResult.FAILED


check = ComprehendDocumentClassifierVolumeUsesCMK()
