resource "awscc_redshift_cluster" "pass" {
  cluster_identifier = "redshift-in-vpc"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  cluster_subnet_group_name = "redshift-subnet-group"
}

resource "awscc_redshift_cluster" "fail" {
  cluster_identifier = "redshift-classic"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  # No cluster_subnet_group_name specified, will be deployed in EC2-Classic mode
}
