resource "awscc_rds_db_instance" "pass_rsa2048" {
  db_instance_identifier = "secure-db-instance-rsa2048"
  engine                 = "mysql"
  engine_version         = "8.0.28"
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  ca_certificate_identifier = "rds-ca-rsa2048-g1"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_rds_db_instance" "pass_rsa4096" {
  db_instance_identifier = "secure-db-instance-rsa4096"
  engine                 = "mysql"
  engine_version         = "8.0.28"
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  ca_certificate_identifier = "rds-ca-rsa4096-g1"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_rds_db_instance" "pass_ecc384" {
  db_instance_identifier = "secure-db-instance-ecc384"
  engine                 = "mysql"
  engine_version         = "8.0.28"
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  ca_certificate_identifier = "rds-ca-ecc384-g1"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_rds_db_instance" "fail_old_cert" {
  db_instance_identifier = "insecure-db-instance-old-cert"
  engine                 = "mysql"
  engine_version         = "8.0.28"
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  ca_certificate_identifier = "rds-ca-2019"
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_rds_db_instance" "fail_default" {
  db_instance_identifier = "insecure-db-instance-default"
  engine                 = "mysql"
  engine_version         = "8.0.28"
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  master_username        = "admin"
  master_user_password   = "Password123!"
  # ca_certificate_identifier not specified (defaults to older cert)
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
