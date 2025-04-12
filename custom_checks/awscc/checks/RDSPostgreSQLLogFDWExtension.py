from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckCategories, CheckResult


class RDSPostgreSQLLogFDWExtension(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that RDS PostgreSQL instances use a non vulnerable version with the log_fdw extension (https://aws.amazon.com/security/security-bulletins/AWS-2022-004/)"
        id = "CKV_AWSCC_96"
        supported_resources = ["awscc_rds_db_instance"]
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check if engine is PostgreSQL
        if conf.get("engine") and isinstance(conf["engine"], list) and len(conf["engine"]) > 0:
            engine = conf["engine"][0].lower()
            if "postgres" not in engine:
                return CheckResult.PASSED  # Not applicable for non-PostgreSQL engines
            
            # Check for engine version
            if conf.get("engine_version") and isinstance(conf["engine_version"], list) and len(conf["engine_version"]) > 0:
                version = conf["engine_version"][0]
                
                # Vulnerable versions:
                # - PostgreSQL 14 versions < 14.1
                # - PostgreSQL 13 versions < 13.5
                # - PostgreSQL 12 versions < 12.9
                # - PostgreSQL 11 versions < 11.14
                # - PostgreSQL 10 versions < 10.19
                # - PostgreSQL 9.6 versions < 9.6.24
                
                if version.startswith("14.") and float(version[3:]) < 1:
                    self.evaluated_keys = ["engine", "engine_version"]
                    return CheckResult.FAILED
                elif version.startswith("13.") and float(version[3:]) < 5:
                    self.evaluated_keys = ["engine", "engine_version"]
                    return CheckResult.FAILED
                elif version.startswith("12.") and float(version[3:]) < 9:
                    self.evaluated_keys = ["engine", "engine_version"]
                    return CheckResult.FAILED
                elif version.startswith("11.") and float(version[3:]) < 14:
                    self.evaluated_keys = ["engine", "engine_version"]
                    return CheckResult.FAILED
                elif version.startswith("10.") and float(version[3:]) < 19:
                    self.evaluated_keys = ["engine", "engine_version"]
                    return CheckResult.FAILED
                elif version.startswith("9.6.") and float(version[4:]) < 24:
                    self.evaluated_keys = ["engine", "engine_version"]
                    return CheckResult.FAILED
                
                return CheckResult.PASSED
        
        return CheckResult.PASSED  # If engine is not specified or not PostgreSQL, the check is not applicable


check = RDSPostgreSQLLogFDWExtension()
