from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class ConnectInstanceS3StorageConfigUsesCMK(BaseResourceCheck):
    def __init__(self):
        name = "Ensure Connect Instance S3 Storage Config uses CMK"
        id = "CKV_AWSCC_131"
        supported_resources = ["awscc_connect_instance_storage_config"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if this is an S3 storage config
        if "storage_type" in conf and conf["storage_type"] == "S3":
            # Check if s3_config is specified
            if "s3_config" in conf:
                s3_config = conf["s3_config"]
                if isinstance(s3_config, dict) and "encryption_config" in s3_config:
                    encryption_config = s3_config["encryption_config"]
                    if isinstance(encryption_config, dict) and "key_id" in encryption_config:
                        if encryption_config["key_id"]:
                            return CheckResult.PASSED
                return CheckResult.FAILED
            return CheckResult.FAILED
        # Not an S3 storage config, so this check is not applicable
        return CheckResult.PASSED


check = ConnectInstanceS3StorageConfigUsesCMK()
