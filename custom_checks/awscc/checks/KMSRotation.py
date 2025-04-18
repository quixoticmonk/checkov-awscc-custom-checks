from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.terraform.checks.resource.base_resource_value_check import (
    BaseResourceValueCheck,
)


class KMSRotation(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure rotation for customer created CMKs is enabled"
        id = "CKV_AWSCC_02"
        supported_resources = ['awscc_kms_key']
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "enable_key_rotation"

    def scan_resource_conf(self, conf):
        # Only symmetric keys support auto rotation. The attribute is optional and defaults to symmetric.
        spec = conf.get('key_spec')
        if not spec or 'SYMMETRIC_DEFAULT' in spec or 'HMAC' in spec:
            return super().scan_resource_conf(conf)
        else:
            return CheckResult.UNKNOWN


check = KMSRotation()
