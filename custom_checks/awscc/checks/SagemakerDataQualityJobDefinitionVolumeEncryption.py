from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck


class SagemakerDataQualityJobDefinitionVolumeEncryption(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure Amazon Sagemaker Data Quality Job uses KMS to encrypt data on attached storage volume"
        id = "CKV_AWSCC_139"
        supported_resources = ["awscc_sagemaker_data_quality_job_definition"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "data_quality_app_specification/volume_kms_key_id"

    def get_expected_value(self):
        return True


check = SagemakerDataQualityJobDefinitionVolumeEncryption()
