# PASS: Security group ingress rule for RDP from specific CIDR
resource "awscc_ec2_security_group_ingress" "pass_rdp_restricted" {
  group_id    = "sg-12345678"
  ip_protocol = "tcp"
  from_port   = 3389
  to_port     = 3389
  cidr_ip     = "10.0.0.0/16"
  description = "Allow RDP from internal network only"
}

# FAIL: Security group ingress rule for RDP from anywhere (IPv4)
resource "awscc_ec2_security_group_ingress" "fail_rdp_unrestricted_ipv4" {
  group_id    = "sg-12345678"
  ip_protocol = "tcp"
  from_port   = 3389
  to_port     = 3389
  cidr_ip     = "0.0.0.0/0"
  description = "Allow RDP from anywhere (IPv4)"
}

# FAIL: Security group ingress rule for RDP from anywhere (IPv6)
resource "awscc_ec2_security_group_ingress" "fail_rdp_unrestricted_ipv6" {
  group_id    = "sg-12345678"
  ip_protocol = "tcp"
  from_port   = 3389
  to_port     = 3389
  cidr_ipv6   = "::/0"
  description = "Allow RDP from anywhere (IPv6)"
}

# FAIL: Security group ingress rule for port range including RDP
resource "awscc_ec2_security_group_ingress" "fail_rdp_port_range" {
  group_id    = "sg-12345678"
  ip_protocol = "tcp"
  from_port   = 3380
  to_port     = 3400
  cidr_ip     = "0.0.0.0/0"
  description = "Allow ports 3380-3400 from anywhere"
}
