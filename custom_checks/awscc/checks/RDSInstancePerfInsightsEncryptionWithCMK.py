from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class RDSInstancePerfInsightsEncryptionWithCMK(BaseResourceCheck):
    def __init__(self):
        name = "Ensure RDS Performance Insights are encrypted using KMS CMKs"
        id = "CKV_AWSCC_93"
        supported_resources = ["awscc_rds_db_instance"]
        categories = [CheckCategories.ENCRYPTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # First check if Performance Insights is enabled
        if conf.get("enable_performance_insights") and isinstance(conf["enable_performance_insights"], list) and len(conf["enable_performance_insights"]) > 0:
            if conf["enable_performance_insights"][0] is True:
                # Then check if a KMS key is specified for Performance Insights
                if conf.get("performance_insights_kms_key_id") and isinstance(conf["performance_insights_kms_key_id"], list) and len(conf["performance_insights_kms_key_id"]) > 0:
                    kms_key = conf["performance_insights_kms_key_id"][0]
                    if kms_key:  # If KMS key is specified and not empty
                        return CheckResult.PASSED
                
                self.evaluated_keys = ["enable_performance_insights", "performance_insights_kms_key_id"]
                return CheckResult.FAILED
        
        # If Performance Insights is not enabled, the check is not applicable
        return CheckResult.PASSED


check = RDSInstancePerfInsightsEncryptionWithCMK()
