from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class ConfigConfigurationAggregatorAllRegions(BaseResourceCheck):
    def __init__(self):
        name = "Ensure AWS Config is enabled in all regions"
        id = "CKV_AWSCC_129"
        supported_resources = ["awscc_config_configuration_aggregator"]
        categories = [CheckCategories.LOGGING]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if account_aggregation_sources is specified
        if "account_aggregation_sources" in conf:
            account_sources = conf["account_aggregation_sources"]
            if isinstance(account_sources, list) and len(account_sources) > 0:
                for source in account_sources:
                    if isinstance(source, dict) and "all_aws_regions" in source:
                        if source["all_aws_regions"] is True:
                            return CheckResult.PASSED
            return CheckResult.FAILED
        
        # Check if organization_aggregation_source is specified
        if "organization_aggregation_source" in conf:
            org_source = conf["organization_aggregation_source"]
            if isinstance(org_source, dict) and "all_aws_regions" in org_source:
                if org_source["all_aws_regions"] is True:
                    return CheckResult.PASSED
        
        return CheckResult.FAILED


check = ConfigConfigurationAggregatorAllRegions()
