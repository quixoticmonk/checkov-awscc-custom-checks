from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class NeptuneClusterBackupRetention(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that Neptune DB cluster has automated backups enabled with adequate retention"
        id = "CKV_AWSCC_45"
        supported_resources = ("awscc_neptune_db_cluster",)
        categories = (CheckCategories.BACKUP_AND_RECOVERY,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if conf.get("backup_retention_period", [1])[0] >= 7:
            return CheckResult.PASSED

        return CheckResult.FAILED

    def get_evaluated_keys(self):
        return ["backup_retention_period"]


check = NeptuneClusterBackupRetention()
