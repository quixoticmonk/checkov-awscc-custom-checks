resource "awscc_rds_db_cluster" "pass_aurora_mysql" {
  db_cluster_identifier = "secure-aurora-mysql-cluster"
  engine                = "aurora-mysql"
  engine_version        = "5.7.mysql_aurora.2.10.2"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  backtrack_window      = 86400  # 24 hours in seconds
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_rds_db_cluster" "pass_postgres" {
  db_cluster_identifier = "postgres-cluster"
  engine                = "aurora-postgresql"
  engine_version        = "14.3"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  # Backtracking not supported for PostgreSQL (not applicable)
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_rds_db_cluster" "fail_aurora_mysql" {
  db_cluster_identifier = "insecure-aurora-mysql-cluster"
  engine                = "aurora-mysql"
  engine_version        = "5.7.mysql_aurora.2.10.2"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  # No backtrack_window specified
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_rds_db_cluster" "fail_aurora_mysql_zero" {
  db_cluster_identifier = "insecure-aurora-mysql-cluster-zero"
  engine                = "aurora-mysql"
  engine_version        = "5.7.mysql_aurora.2.10.2"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  backtrack_window      = 0  # Disabled
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
