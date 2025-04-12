# pass - no public IP associated
resource "awscc_ec2_instance" "pass" {
  instance_type               = "t2.micro"
  image_id                    = "ami-0c55b159cbfafe1f0"
  subnet_id                   = "subnet-0123456789abcdef0"
  associate_public_ip_address = false
}

# pass - no public IP configuration specified (defaults to false in private subnets)
resource "awscc_ec2_instance" "pass_default" {
  instance_type = "t2.micro"
  image_id      = "ami-0c55b159cbfafe1f0"
  subnet_id     = "subnet-0123456789abcdef0"
}

# fail - public IP explicitly associated at instance level
resource "awscc_ec2_instance" "fail_instance" {
  instance_type               = "t2.micro"
  image_id                    = "ami-0c55b159cbfafe1f0"
  subnet_id                   = "subnet-0123456789abcdef0"
  associate_public_ip_address = true
}

# fail - public IP associated with network interface
resource "awscc_ec2_instance" "fail_interface" {
  instance_type = "t2.micro"
  image_id      = "ami-0c55b159cbfafe1f0"
  network_interfaces = [
    {
      device_index               = 0
      subnet_id                  = "subnet-0123456789abcdef0"
      associate_public_ip_address = true
    }
  ]
}
