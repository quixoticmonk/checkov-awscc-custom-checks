from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class CodeArtifactDomainEncryptedWithCMK(BaseResourceCheck):
    def __init__(self):
        name = "Ensure CodeArtifact Domain is encrypted by KMS using a customer managed Key (CMK)"
        id = "CKV_AWSCC_125"
        supported_resources = ["awscc_codeartifact_domain"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if encryption_key is specified
        if "encryption_key" in conf:
            if conf["encryption_key"]:
                # Check if it's not the default AWS managed key
                if not str(conf["encryption_key"]).startswith("arn:aws:kms:region:aws:key"):
                    return CheckResult.PASSED
        return CheckResult.FAILED


check = CodeArtifactDomainEncryptedWithCMK()
