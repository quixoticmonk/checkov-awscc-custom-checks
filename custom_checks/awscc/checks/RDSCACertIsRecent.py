from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class RDSCACertIsRecent(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure RDS uses a modern CaCert"
        id = "CKV_AWSCC_82"
        supported_resources = ["awscc_rds_db_instance"]
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "ca_certificate_identifier"

    def get_expected_values(self):
        return ["rds-ca-rsa2048-g1", "rds-ca-rsa4096-g1", "rds-ca-ecc384-g1"]


check = RDSCACertIsRecent()
