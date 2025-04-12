from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class ConnectInstanceKinesisVideoStreamStorageConfigUsesCMK(BaseResourceCheck):
    def __init__(self):
        name = "Ensure Connect Instance Kinesis Video Stream Storage Config uses CMK"
        id = "CKV_AWSCC_130"
        supported_resources = ["awscc_connect_instance_storage_config"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if this is a Kinesis Video Stream storage config
        if "storage_type" in conf and conf["storage_type"] == "KINESIS_VIDEO_STREAM":
            # Check if kinesis_video_stream_config is specified
            if "kinesis_video_stream_config" in conf:
                kvs_config = conf["kinesis_video_stream_config"]
                if isinstance(kvs_config, dict) and "encryption_config" in kvs_config:
                    encryption_config = kvs_config["encryption_config"]
                    if isinstance(encryption_config, dict) and "key_id" in encryption_config:
                        if encryption_config["key_id"]:
                            return CheckResult.PASSED
                return CheckResult.FAILED
            return CheckResult.FAILED
        # Not a Kinesis Video Stream storage config, so this check is not applicable
        return CheckResult.PASSED


check = ConnectInstanceKinesisVideoStreamStorageConfigUsesCMK()
