# pass - account aggregation source with all regions enabled
resource "awscc_config_configuration_aggregator" "pass_account" {
  name = "example-aggregator-account"
  account_aggregation_sources = [
    {
      account_ids    = ["123456789012"]
      all_aws_regions = true
    }
  ]
}

# pass - organization aggregation source with all regions enabled
resource "awscc_config_configuration_aggregator" "pass_org" {
  name = "example-aggregator-org"
  organization_aggregation_source = {
    all_aws_regions = true
    role_arn        = "arn:aws:iam::123456789012:role/aws-service-role/config.amazonaws.com/AWSServiceRoleForConfig"
  }
}

# fail - account aggregation source with specific regions only
resource "awscc_config_configuration_aggregator" "fail_account" {
  name = "example-aggregator-account-specific-regions"
  account_aggregation_sources = [
    {
      account_ids    = ["123456789012"]
      all_aws_regions = false
      aws_regions     = ["us-east-1", "us-west-2"]
    }
  ]
}

# fail - organization aggregation source with specific regions only
resource "awscc_config_configuration_aggregator" "fail_org" {
  name = "example-aggregator-org-specific-regions"
  organization_aggregation_source = {
    all_aws_regions = false
    aws_regions     = ["us-east-1", "us-west-2"]
    role_arn        = "arn:aws:iam::123456789012:role/aws-service-role/config.amazonaws.com/AWSServiceRoleForConfig"
  }
}
