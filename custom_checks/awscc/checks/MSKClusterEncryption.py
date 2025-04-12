from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from typing import List


class MSKClusterEncryption(BaseResourceCheck):
    def __init__(self):
        name = "Ensure MSK Cluster encryption in rest and transit is enabled"
        id = "CKV_AWSCC_52"
        supported_resources = ('awscc_msk_cluster',)
        categories = (CheckCategories.ENCRYPTION,)
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Note: As long as the 'encryption_info' block is specified, the cluster
        # will be encrypted at rest even if 'encryption_at_rest_kms_key_arn' is not specified
        if 'encryption_info' in conf.keys() and isinstance(conf['encryption_info'], dict):
            encryption = conf['encryption_info']
            if 'encryption_in_transit' in encryption and isinstance(encryption['encryption_in_transit'], dict):
                transit = encryption['encryption_in_transit']
                if 'client_broker' in transit and transit['client_broker'] != 'TLS':
                    return CheckResult.FAILED
                if 'in_cluster' in transit and transit['in_cluster'] is False:
                    return CheckResult.FAILED
            return CheckResult.PASSED
        return CheckResult.FAILED

    def get_evaluated_keys(self) -> List[str]:
        return ['encryption_info/encryption_in_transit/client_broker',
                'encryption_info/encryption_in_transit/in_cluster']


check = MSKClusterEncryption()
