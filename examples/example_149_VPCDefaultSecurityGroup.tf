resource "awscc_ec2_security_group" "pass_149" {
  group_name        = "custom-sg"
  group_description = "Custom security group"
  vpc_id            = "vpc-12345678"

  security_group_ingress = [
    {
      ip_protocol = "tcp"
      from_port   = 80
      to_port     = 80
      cidr_ip     = "10.0.0.0/8"
    }
  ]
}

resource "awscc_ec2_security_group" "pass2_149" {
  group_name        = "default"
  group_description = "default VPC security group"
  vpc_id            = "vpc-12345678"
}

resource "awscc_ec2_security_group" "fail_149" {
  group_name        = "default"
  group_description = "default VPC security group"
  vpc_id            = "vpc-87654321"

  security_group_ingress = [
    {
      ip_protocol = "tcp"
      from_port   = 22
      to_port     = 22
      cidr_ip     = "0.0.0.0/0"
    }
  ]
}

resource "awscc_ec2_security_group" "fail2_149" {
  group_name        = "default"
  group_description = "default VPC security group"
  vpc_id            = "vpc-11111111"

  security_group_egress = [
    {
      ip_protocol = "tcp"
      from_port   = 443
      to_port     = 443
      cidr_ip     = "10.0.0.0/8"
    }
  ]
}
