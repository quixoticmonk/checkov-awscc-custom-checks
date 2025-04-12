resource "awscc_transfer_server" "pass_vpc" {
  identity_provider_type = "SERVICE_MANAGED"
  endpoint_type          = "VPC"
  
  endpoint_details = {
    vpc_id = "vpc-12345678"
    subnet_ids = ["subnet-12345678", "subnet-87654321"]
    security_group_ids = ["sg-12345678"]
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_transfer_server" "pass_vpc_endpoint" {
  identity_provider_type = "SERVICE_MANAGED"
  endpoint_type          = "VPC_ENDPOINT"
  
  endpoint_details = {
    vpc_endpoint_id = "vpce-12345678"
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_transfer_server" "fail_public" {
  identity_provider_type = "SERVICE_MANAGED"
  endpoint_type          = "PUBLIC"
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_transfer_server" "fail_default" {
  identity_provider_type = "SERVICE_MANAGED"
  # No endpoint_type specified (defaults to PUBLIC)
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
