from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class TimestreamDatabaseKMSKey(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that Timestream database is encrypted with KMS CMK"
        id = "CKV_AWSCC_99"
        supported_resources = ["awscc_timestream_database"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if KMS key is specified
        if conf.get("kms_key_id") and isinstance(conf["kms_key_id"], list) and len(conf["kms_key_id"]) > 0:
            kms_key = conf["kms_key_id"][0]
            if kms_key:  # If KMS key is specified and not empty
                return CheckResult.PASSED
        
        self.evaluated_keys = ["kms_key_id"]
        return CheckResult.FAILED


check = TimestreamDatabaseKMSKey()
