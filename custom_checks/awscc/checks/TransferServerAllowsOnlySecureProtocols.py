from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class TransferServerAllowsOnlySecureProtocols(BaseResourceCheck):
    def __init__(self):
        name = "Ensure Transfer Server allows only secure protocols"
        id = "CKV_AWSCC_100"
        supported_resources = ["awscc_transfer_server"]
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if protocols are specified
        if conf.get("protocols") and isinstance(conf["protocols"], list) and len(conf["protocols"]) > 0:
            protocols = conf["protocols"][0]
            
            # Check if protocols is a list and contains only secure protocols (SFTP, FTPS)
            if isinstance(protocols, list):
                # Check if any insecure protocol is present
                if "FTP" in protocols:
                    self.evaluated_keys = ["protocols"]
                    return CheckResult.FAILED
                
                # Check if at least one secure protocol is present
                if "SFTP" in protocols or "FTPS" in protocols:
                    return CheckResult.PASSED
            
            self.evaluated_keys = ["protocols"]
            return CheckResult.FAILED
        
        # If protocols are not specified, default is SFTP only which is secure
        return CheckResult.PASSED


check = TransferServerAllowsOnlySecureProtocols()
