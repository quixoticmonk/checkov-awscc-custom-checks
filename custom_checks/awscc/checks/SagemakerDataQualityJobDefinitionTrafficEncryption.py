from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck


class SagemakerDataQualityJobDefinitionTrafficEncryption(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure Amazon Sagemaker Data Quality Job encrypts all communications between instances used for monitoring jobs"
        id = "CKV_AWSCC_140"
        supported_resources = ["awscc_sagemaker_data_quality_job_definition"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "network_config/enable_inter_container_traffic_encryption"

    def get_expected_value(self):
        return True


check = SagemakerDataQualityJobDefinitionTrafficEncryption()
