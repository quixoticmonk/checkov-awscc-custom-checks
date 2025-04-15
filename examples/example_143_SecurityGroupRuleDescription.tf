# PASS: Security group ingress rule with description
resource "awscc_ec2_security_group_ingress" "pass_ingress" {
  group_id    = "sg-12345678"
  ip_protocol = "tcp"
  from_port   = 443
  to_port     = 443
  cidr_ip     = "10.0.0.0/16"
  description = "Allow HTTPS traffic from internal network"
}

# FAIL: Security group ingress rule without description
resource "awscc_ec2_security_group_ingress" "fail_ingress" {
  group_id    = "sg-12345678"
  ip_protocol = "tcp"
  from_port   = 443
  to_port     = 443
  cidr_ip     = "10.0.0.0/16"
}

# PASS: Security group egress rule with description
resource "awscc_ec2_security_group_egress" "pass_egress" {
  group_id    = "sg-12345678"
  ip_protocol = "tcp"
  from_port   = 443
  to_port     = 443
  cidr_ip     = "0.0.0.0/0"
  description = "Allow outbound HTTPS traffic"
}

# FAIL: Security group egress rule without description
resource "awscc_ec2_security_group_egress" "fail_egress" {
  group_id    = "sg-12345678"
  ip_protocol = "tcp"
  from_port   = 443
  to_port     = 443
  cidr_ip     = "0.0.0.0/0"
}
