resource "awscc_redshift_cluster" "pass" {
  cluster_identifier   = "redshift-private"
  node_type            = "dc2.large"
  master_username      = "admin"
  master_user_password = "Password123"
  publicly_accessible  = false
}

resource "awscc_redshift_cluster" "fail" {
  cluster_identifier   = "redshift-public"
  node_type            = "dc2.large"
  master_username      = "admin"
  master_user_password = "Password123"
  publicly_accessible  = true
}
