# pass - detailed monitoring enabled
resource "awscc_ec2_instance" "pass" {
  instance_type = "t2.micro"
  image_id      = "ami-0c55b159cbfafe1f0"
  subnet_id     = "subnet-0123456789abcdef0"
  monitoring    = true
}

# fail - detailed monitoring explicitly disabled
resource "awscc_ec2_instance" "fail_disabled" {
  instance_type = "t2.micro"
  image_id      = "ami-0c55b159cbfafe1f0"
  subnet_id     = "subnet-0123456789abcdef0"
  monitoring    = false
}

# fail - detailed monitoring not specified (defaults to false)
resource "awscc_ec2_instance" "fail_default" {
  instance_type = "t2.micro"
  image_id      = "ami-0c55b159cbfafe1f0"
  subnet_id     = "subnet-0123456789abcdef0"
}
