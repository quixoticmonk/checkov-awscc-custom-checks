# pass - using CMK
resource "awscc_codeartifact_domain" "pass" {
  domain_name    = "example-domain"
  encryption_key = "arn:aws:kms:us-east-1:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
}

# fail - no encryption key specified
resource "awscc_codeartifact_domain" "fail_no_key" {
  domain_name = "example-domain-no-key"
}

# fail - using AWS managed key
resource "awscc_codeartifact_domain" "fail_aws_key" {
  domain_name    = "example-domain-aws-key"
  encryption_key = "arn:aws:kms:region:aws:key/aws/codeartifact"
}
