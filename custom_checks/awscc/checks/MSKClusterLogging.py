from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class MSKClusterLogging(BaseResourceCheck):
    def __init__(self):
        name = "Ensure MSK Cluster logging is enabled"
        id = "CKV_AWSCC_53"
        supported_resources = ('awscc_msk_cluster',)
        categories = (CheckCategories.LOGGING,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if 'logging_info' in conf.keys() and isinstance(conf['logging_info'], dict):
            if 'broker_logs' in conf['logging_info'] and isinstance(conf['logging_info']['broker_logs'], dict):
                logging = conf['logging_info']['broker_logs']
                types = ["cloudwatch_logs", "firehose", "s3"]
                for log_type in types:
                    if log_type in logging and isinstance(logging[log_type], dict):
                        if 'enabled' in logging[log_type] and logging[log_type]['enabled'] is True:
                            self.evaluated_keys = [f'logging_info/broker_logs/{log_type}/enabled']
                            return CheckResult.PASSED
        return CheckResult.FAILED


check = MSKClusterLogging()
