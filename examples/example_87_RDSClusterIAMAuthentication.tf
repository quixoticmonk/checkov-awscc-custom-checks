resource "awscc_rds_db_cluster" "pass" {
  db_cluster_identifier = "secure-db-cluster"
  engine                = "aurora-mysql"
  engine_version        = "5.7.mysql_aurora.2.10.2"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  enable_iam_database_authentication = true
  
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
  
  enable_iam_database_authentication = false
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_rds_db_cluster" "fail2" {
  db_cluster_identifier = "insecure-db-cluster-default"
  engine                = "aurora-mysql"
  engine_version        = "5.7.mysql_aurora.2.10.2"
  master_username       = "admin"
  master_user_password  = "Password123!"
  
  # enable_iam_database_authentication not specified (defaults to false)
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
