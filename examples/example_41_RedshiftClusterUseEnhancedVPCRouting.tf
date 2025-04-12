resource "awscc_redshift_cluster" "pass" {
  cluster_identifier = "redshift-enhanced-vpc"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  enhanced_vpc_routing = true
}

resource "awscc_redshift_cluster" "fail" {
  cluster_identifier = "redshift-standard-vpc"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  enhanced_vpc_routing = false
}

resource "awscc_redshift_cluster" "fail2" {
  cluster_identifier = "redshift-default-vpc"
  node_type          = "dc2.large"
  master_username    = "admin"
  master_user_password = "Password123"
  # enhanced_vpc_routing defaults to false
}
