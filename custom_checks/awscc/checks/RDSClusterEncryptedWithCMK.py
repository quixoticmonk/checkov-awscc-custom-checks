from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class RDSClusterEncryptedWithCMK(BaseResourceCheck):
    def __init__(self):
        name = "Ensure RDS Clusters are encrypted using KMS CMKs"
        id = "CKV_AWSCC_86"
        supported_resources = ["awscc_rds_db_cluster"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # First check if storage is encrypted
        if conf.get("storage_encrypted") and isinstance(conf["storage_encrypted"], list) and len(conf["storage_encrypted"]) > 0:
            if conf["storage_encrypted"][0] is True:
                # Then check if a KMS key is specified
                if conf.get("kms_key_id") and isinstance(conf["kms_key_id"], list) and len(conf["kms_key_id"]) > 0:
                    kms_key = conf["kms_key_id"][0]
                    if kms_key:  # If KMS key is specified and not empty
                        return CheckResult.PASSED
                
                self.evaluated_keys = ["storage_encrypted", "kms_key_id"]
                return CheckResult.FAILED
            
            self.evaluated_keys = ["storage_encrypted"]
            return CheckResult.FAILED
        
        self.evaluated_keys = ["storage_encrypted"]
        return CheckResult.FAILED


check = RDSClusterEncryptedWithCMK()
