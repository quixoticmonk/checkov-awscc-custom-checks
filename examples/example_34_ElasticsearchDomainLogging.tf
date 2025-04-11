resource "awscc_opensearch_domain" "pass" {
  domain_name = "example-domain"
  
  cluster_config {
    instance_type = "t3.small.search"
  }
  
  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }
  
  log_publishing_options {
    cloudwatch_log_group_arn = "arn:aws:logs:us-west-2:123456789012:log-group:/aws/opensearch/domains/example-domain/index-logs"
    log_type                 = "INDEX_SLOW_LOGS"
    enabled                  = true
  }
}

resource "awscc_opensearch_domain" "fail" {
  domain_name = "example-domain-no-logs"
  
  cluster_config {
    instance_type = "t3.small.search"
  }
  
  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }
  
  # No log_publishing_options defined
}

resource "awscc_opensearch_domain" "fail2" {
  domain_name = "example-domain-disabled-logs"
  
  cluster_config {
    instance_type = "t3.small.search"
  }
  
  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }
  
  log_publishing_options {
    cloudwatch_log_group_arn = "arn:aws:logs:us-west-2:123456789012:log-group:/aws/opensearch/domains/example-domain/index-logs"
    log_type                 = "INDEX_SLOW_LOGS"
    enabled                  = false
  }
}
