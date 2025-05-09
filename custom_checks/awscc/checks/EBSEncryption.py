from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class EBSEncryption(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure all data stored in the EBS is securely encrypted"
        id = "CKV_AWSCC_01"
        supported_resources = ['awscc_ec2_volume']
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "encrypted"


check = EBSEncryption()
