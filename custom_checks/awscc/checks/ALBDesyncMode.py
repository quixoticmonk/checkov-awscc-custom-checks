from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class ALBDesyncMode(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that ALB is configured with defensive or strictest desync mitigation mode"
        id = "CKV_AWSCC_104"
        supported_resources = ["awscc_elasticloadbalancingv2_load_balancer"]
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if load balancer type is application
        if conf.get("type") and isinstance(conf["type"], list) and len(conf["type"]) > 0:
            lb_type = conf["type"][0]
            if lb_type.lower() != "application":
                return CheckResult.PASSED  # Not applicable for non-ALB load balancers
        
        # Check if desync mitigation mode is specified
        if conf.get("attributes") and isinstance(conf["attributes"], list) and len(conf["attributes"]) > 0:
            for attribute in conf["attributes"][0]:
                if isinstance(attribute, dict) and attribute.get("key") == "routing.http.desync_mitigation_mode":
                    mode = attribute.get("value")
                    if mode in ["defensive", "strictest"]:
                        return CheckResult.PASSED
                    else:
                        self.evaluated_keys = ["attributes"]
                        return CheckResult.FAILED
        
        # If no desync mitigation mode is specified, it defaults to 'defensive' which is acceptable
        return CheckResult.PASSED


check = ALBDesyncMode()
