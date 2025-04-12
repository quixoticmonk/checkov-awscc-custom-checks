# pass - EBS optimization explicitly enabled
resource "awscc_ec2_instance" "pass_explicit" {
  instance_type  = "t2.micro"
  image_id       = "ami-0c55b159cbfafe1f0"
  subnet_id      = "subnet-0123456789abcdef0"
  ebs_optimized  = true
}

# pass - instance type that is EBS optimized by default
resource "awscc_ec2_instance" "pass_default" {
  instance_type = "m5.large"
  image_id      = "ami-0c55b159cbfafe1f0"
  subnet_id     = "subnet-0123456789abcdef0"
}

# fail - EBS optimization explicitly disabled
resource "awscc_ec2_instance" "fail_disabled" {
  instance_type  = "t2.micro"
  image_id       = "ami-0c55b159cbfafe1f0"
  subnet_id      = "subnet-0123456789abcdef0"
  ebs_optimized  = false
}

# fail - instance type not EBS optimized by default and not explicitly enabled
resource "awscc_ec2_instance" "fail_default" {
  instance_type = "t2.micro"
  image_id      = "ami-0c55b159cbfafe1f0"
  subnet_id     = "subnet-0123456789abcdef0"
}
