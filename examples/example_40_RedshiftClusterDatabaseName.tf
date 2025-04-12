resource "awscc_redshift_cluster" "pass" {
  cluster_identifier = "redshift-custom-db"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  database_name      = "custom_database"
}

resource "awscc_redshift_cluster" "fail" {
  cluster_identifier = "redshift-default-db"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  # database_name not specified, will use default
}
