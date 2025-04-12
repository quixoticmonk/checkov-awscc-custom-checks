from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck
from checkov.common.models.enums import CheckCategories


class RDSClusterCopyTags(BaseResourceValueCheck):
    def __init__(self):
        name = "Ensure RDS cluster configured to copy tags to snapshots"
        id = "CKV_AWSCC_85"
        supported_resources = ["awscc_rds_db_cluster"]
        categories = [CheckCategories.BACKUP_AND_RECOVERY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "copy_tags_to_snapshot"

    def get_expected_value(self):
        return True


check = RDSClusterCopyTags()
