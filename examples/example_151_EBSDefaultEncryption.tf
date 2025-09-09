resource "awscc_ec2_ebs_encryption_by_default" "pass_151" {
  ebs_encryption_by_default = true
}

resource "awscc_ec2_ebs_encryption_by_default" "fail_151" {
  ebs_encryption_by_default = false
}
