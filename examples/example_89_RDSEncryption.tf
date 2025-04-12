resource "awscc_rds_db_instance" "pass" {
  db_instance_identifier = "secure-db-instance"
  engine                 = "mysql"
  engine_version         = "8.0.28"
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  storage_encrypted      = true
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
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
  storage_encrypted      = false
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_rds_db_instance" "fail2" {
  db_instance_identifier = "insecure-db-instance-default"
  engine                 = "mysql"
  engine_version         = "8.0.28"
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  # storage_encrypted not specified (defaults to false)
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
