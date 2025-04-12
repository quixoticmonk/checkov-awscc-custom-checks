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

resource "awscc_rds_db_cluster" "pass_postgres" {
  db_cluster_identifier = "secure-postgres-cluster"
  engine                = "postgres"
  engine_version        = "14.3"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  enabled_cloudwatch_logs_exports = ["postgresql"]
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_rds_db_cluster" "fail" {
  db_cluster_identifier = "insecure-db-cluster"
  engine                = "aurora-mysql"
  engine_version        = "5.7.mysql_aurora.2.10.2"
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

resource "awscc_rds_db_cluster" "fail2" {
  db_cluster_identifier = "insecure-db-cluster-empty"
  engine                = "aurora-mysql"
  engine_version        = "5.7.mysql_aurora.2.10.2"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  enabled_cloudwatch_logs_exports = []  # Empty list
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
