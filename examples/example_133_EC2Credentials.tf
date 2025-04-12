# pass - no secrets in user data
resource "awscc_ec2_instance" "pass" {
  instance_type = "t2.micro"
  image_id      = "ami-0c55b159cbfafe1f0"
  subnet_id     = "subnet-0123456789abcdef0"
  user_data     = <<-EOF
    #!/bin/bash
    echo "Hello, World!"
    apt-get update
    apt-get install -y nginx
    systemctl start nginx
  EOF
}

# pass - using variable reference for sensitive data
resource "awscc_ec2_instance" "pass_variable" {
  instance_type = "t2.micro"
  image_id      = "ami-0c55b159cbfafe1f0"
  subnet_id     = "subnet-0123456789abcdef0"
  user_data     = "${var.user_data_script}"
}

# fail - hardcoded password in user data
resource "awscc_ec2_instance" "fail_password" {
  instance_type = "t2.micro"
  image_id      = "ami-0c55b159cbfafe1f0"
  subnet_id     = "subnet-0123456789abcdef0"
  user_data     = <<-EOF
    #!/bin/bash
    echo "Hello, World!"
    apt-get update
    apt-get install -y nginx
    systemctl start nginx
    
    # Create a user with password
    useradd -m -p password123 admin
  EOF
}

# fail - hardcoded AWS credentials in user data
resource "awscc_ec2_instance" "fail_aws_creds" {
  instance_type = "t2.micro"
  image_id      = "ami-0c55b159cbfafe1f0"
  subnet_id     = "subnet-0123456789abcdef0"
  user_data     = <<-EOF
    #!/bin/bash
    echo "Hello, World!"
    
    # Configure AWS CLI
    aws configure set aws_access_key_id AKIAIOSFODNN7EXAMPLE
    aws configure set aws_secret_access_key wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
    aws configure set default.region us-east-1
  EOF
}

# fail - hardcoded private key in user data
resource "awscc_ec2_instance" "fail_private_key" {
  instance_type = "t2.micro"
  image_id      = "ami-0c55b159cbfafe1f0"
  subnet_id     = "subnet-0123456789abcdef0"
  user_data     = <<-EOF
    #!/bin/bash
    echo "Hello, World!"
    
    # Save private key
    cat > /home/ec2-user/.ssh/id_rsa << 'EOK'
    -----BEGIN RSA PRIVATE KEY-----
    MIIEpAIBAAKCAQEA1V5FGlJ9UmQ4TARgcH3CXbDfJ6tE6dYHD1FWRoJ5F5AvOFvf
    ...
    -----END RSA PRIVATE KEY-----
    EOK
    chmod 600 /home/ec2-user/.ssh/id_rsa
  EOF
}
