from checkov.common.models.enums import CheckCategories
from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck


class ECRImageScanning(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure ECR image scanning on push is enabled"
        id = "CKV_AWSCC_09"
        supported_resources = ['awscc_ecr_repository']
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "image_scanning_configuration/scan_on_push"
        
    def get_expected_value(self):
        return True


check = ECRImageScanning()
