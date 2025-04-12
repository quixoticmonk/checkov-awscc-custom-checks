from checkov.common.models.enums import CheckCategories
from checkov.terraform.checks.resource.base_resource_value_check import BaseResourceValueCheck


class NeptuneDBClustersCopyTagsToSnapshots(BaseResourceValueCheck):
    def __init__(self):
        name = "Neptune DB clusters should be configured to copy tags to snapshots"
        id = "CKV_AWSCC_50"
        supported_resources = ("awscc_neptune_db_cluster",)
        categories = (CheckCategories.BACKUP_AND_RECOVERY,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def get_inspected_key(self):
        return "copy_tags_to_snapshot"

    def get_expected_value(self):
        return True


check = NeptuneDBClustersCopyTagsToSnapshots()
