resource "awscc_rds_db_instance" "pass_postgres14" {
  db_instance_identifier = "secure-postgres14-instance"
  engine                 = "postgres"
  engine_version         = "14.1"  # Safe version
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_rds_db_instance" "pass_postgres13" {
  db_instance_identifier = "secure-postgres13-instance"
  engine                 = "postgres"
  engine_version         = "13.5"  # Safe version
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_rds_db_instance" "pass_mysql" {
  db_instance_identifier = "mysql-instance"
  engine                 = "mysql"
  engine_version         = "8.0.28"  # Not PostgreSQL, so not affected
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_rds_db_instance" "fail_postgres14" {
  db_instance_identifier = "vulnerable-postgres14-instance"
  engine                 = "postgres"
  engine_version         = "14.0"  # Vulnerable version
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_rds_db_instance" "fail_postgres13" {
  db_instance_identifier = "vulnerable-postgres13-instance"
  engine                 = "postgres"
  engine_version         = "13.4"  # Vulnerable version
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_rds_db_instance" "fail_postgres12" {
  db_instance_identifier = "vulnerable-postgres12-instance"
  engine                 = "postgres"
  engine_version         = "12.8"  # Vulnerable version
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
