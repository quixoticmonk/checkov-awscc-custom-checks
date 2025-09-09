resource "awscc_ec2_instance" "pass_152" {
  image_id      = "ami-0abcdef1234567890"
  instance_type = "t3.micro"

  metadata_options = {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

  tags = [
    {
      key   = "Name"
      value = "imdsv2-required-instance"
    }
  ]
}

resource "awscc_ec2_instance" "fail_152" {
  image_id      = "ami-0abcdef1234567890"
  instance_type = "t3.micro"

  metadata_options = {
    http_tokens   = "optional"
    http_endpoint = "enabled"
  }

  tags = [
    {
      key   = "Name"
      value = "imdsv2-optional-instance"
    }
  ]
}

resource "awscc_ec2_instance" "fail2_152" {
  image_id      = "ami-0abcdef1234567890"
  instance_type = "t3.micro"

  tags = [
    {
      key   = "Name"
      value = "no-metadata-options-instance"
    }
  ]
}
