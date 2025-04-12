from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class EKSControlPlaneLogging(BaseResourceCheck):
    def __init__(self):
        name = "Ensure Amazon EKS control plane logging is enabled for all log types"
        id = "CKV_AWSCC_68"
        supported_resources = ["awscc_eks_cluster"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        if conf.get("logging") and isinstance(conf["logging"], list) and len(conf["logging"]) > 0:
            logging_conf = conf["logging"][0]
            if logging_conf.get("cluster_logging") and isinstance(logging_conf["cluster_logging"], list) and len(logging_conf["cluster_logging"]) > 0:
                cluster_logging = logging_conf["cluster_logging"][0]
                if cluster_logging.get("enabled_types") and isinstance(cluster_logging["enabled_types"], list):
                    enabled_types = cluster_logging["enabled_types"]
                    required_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
                    
                    # Check if all required log types are enabled
                    for log_type in required_types:
                        found = False
                        for enabled_type in enabled_types:
                            if isinstance(enabled_type, dict) and enabled_type.get("type") == [log_type]:
                                found = True
                                break
                        if not found:
                            self.evaluated_keys = ["logging/[0]/cluster_logging/[0]/enabled_types"]
                            return CheckResult.FAILED
                    
                    return CheckResult.PASSED
        
        self.evaluated_keys = ["logging"]
        return CheckResult.FAILED


check = EKSControlPlaneLogging()
