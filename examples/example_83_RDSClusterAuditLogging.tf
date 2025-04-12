resource "awscc_rds_db_cluster" "pass_mysql" {
  db_cluster_identifier = "secure-mysql-cluster"
  engine                = "mysql"
  engine_version        = "8.0.28"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_rds_db_cluster" "pass_aurora_mysql" {
  db_cluster_identifier = "secure-aurora-mysql-cluster"
  engine                = "aurora-mysql"
  engine_version        = "8.0.mysql_aurora.3.02.0"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_rds_db_cluster" "pass_postgres" {
  db_cluster_identifier = "postgres-cluster"
  engine                = "postgres"
  engine_version        = "14.3"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  # No audit logs for PostgreSQL (not applicable)
  enabled_cloudwatch_logs_exports = ["postgresql"]
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_rds_db_cluster" "fail_mysql" {
  db_cluster_identifier = "insecure-mysql-cluster"
  engine                = "mysql"
  engine_version        = "8.0.28"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  enabled_cloudwatch_logs_exports = ["error", "general", "slowquery"]
  # Missing "audit" log export
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_rds_db_cluster" "fail_aurora_mysql" {
  db_cluster_identifier = "insecure-aurora-mysql-cluster"
  engine                = "aurora-mysql"
  engine_version        = "8.0.mysql_aurora.3.02.0"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  # No log exports configured
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
