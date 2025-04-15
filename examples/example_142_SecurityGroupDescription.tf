# PASS: Security group with description
resource "awscc_ec2_security_group" "pass" {
  group_name        = "example-sg-pass"
  group_description = "Example security group with proper description"
  vpc_id            = "vpc-12345678"
}

# FAIL: Security group without description
resource "awscc_ec2_security_group" "fail" {
  group_name = "example-sg-fail"
  vpc_id     = "vpc-12345678"
}
