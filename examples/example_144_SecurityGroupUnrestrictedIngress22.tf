# PASS: Security group ingress rule for SSH from specific CIDR
resource "awscc_ec2_security_group_ingress" "pass_ssh_restricted" {
  group_id    = "sg-12345678"
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ip     = "10.0.0.0/16"
  description = "Allow SSH from internal network only"
}

# FAIL: Security group ingress rule for SSH from anywhere (IPv4)
resource "awscc_ec2_security_group_ingress" "fail_ssh_unrestricted_ipv4" {
  group_id    = "sg-12345678"
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ip     = "0.0.0.0/0"
  description = "Allow SSH from anywhere (IPv4)"
}

# FAIL: Security group ingress rule for SSH from anywhere (IPv6)
resource "awscc_ec2_security_group_ingress" "fail_ssh_unrestricted_ipv6" {
  group_id    = "sg-12345678"
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv6   = "::/0"
  description = "Allow SSH from anywhere (IPv6)"
}

# FAIL: Security group ingress rule for port range including SSH
resource "awscc_ec2_security_group_ingress" "fail_ssh_port_range" {
  group_id    = "sg-12345678"
  ip_protocol = "tcp"
  from_port   = 20
  to_port     = 30
  cidr_ip     = "0.0.0.0/0"
  description = "Allow ports 20-30 from anywhere"
}
