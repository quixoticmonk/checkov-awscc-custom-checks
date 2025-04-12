resource "awscc_rds_db_instance" "pass" {
  db_instance_identifier = "secure-db-instance"
  engine                 = "mysql"
  engine_version         = "8.0.28"
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  
  enable_performance_insights = true
  performance_insights_kms_key_id = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
  performance_insights_retention_period = 7
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_rds_db_instance" "pass_not_enabled" {
  db_instance_identifier = "db-instance-no-insights"
  engine                 = "mysql"
  engine_version         = "8.0.28"
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  
  enable_performance_insights = false
  # No KMS key needed since Performance Insights is not enabled
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_rds_db_instance" "fail" {
  db_instance_identifier = "insecure-db-instance"
  engine                 = "mysql"
  engine_version         = "8.0.28"
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  
  enable_performance_insights = true
  # No KMS key specified (uses default AWS managed key)
  performance_insights_retention_period = 7
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
