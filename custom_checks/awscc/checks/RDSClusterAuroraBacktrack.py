from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class RDSClusterAuroraBacktrack(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that RDS Aurora Clusters have backtracking enabled"
        id = "CKV_AWSCC_84"
        supported_resources = ["awscc_rds_db_cluster"]
        categories = [CheckCategories.BACKUP_AND_RECOVERY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if engine is Aurora MySQL
        if conf.get("engine") and isinstance(conf["engine"], list) and len(conf["engine"]) > 0:
            engine = conf["engine"][0].lower()
            if "aurora-mysql" not in engine:
                return CheckResult.PASSED  # Not applicable for non-Aurora MySQL engines
            
            # Check for backtrack_window
            if conf.get("backtrack_window") and isinstance(conf["backtrack_window"], list) and len(conf["backtrack_window"]) > 0:
                backtrack_window = conf["backtrack_window"][0]
                if isinstance(backtrack_window, int) and backtrack_window > 0:
                    return CheckResult.PASSED
            
            self.evaluated_keys = ["backtrack_window"]
            return CheckResult.FAILED
        
        return CheckResult.PASSED  # If engine is not specified, we can't determine if it's Aurora MySQL


check = RDSClusterAuroraBacktrack()
