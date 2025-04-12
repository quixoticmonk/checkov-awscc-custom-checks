resource "awscc_transfer_server" "pass" {
  identity_provider_type = "SERVICE_MANAGED"
  security_policy_name   = "TransferSecurityPolicy-2023-05"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_transfer_server" "fail_old_policy" {
  identity_provider_type = "SERVICE_MANAGED"
  security_policy_name   = "TransferSecurityPolicy-2022-03"
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_transfer_server" "fail_older_policy" {
  identity_provider_type = "SERVICE_MANAGED"
  security_policy_name   = "TransferSecurityPolicy-2020-06"
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_transfer_server" "fail_default" {
  identity_provider_type = "SERVICE_MANAGED"
  # No security_policy_name specified (defaults to older policy)
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
