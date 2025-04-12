resource "awscc_transfer_server" "pass_sftp" {
  identity_provider_type = "SERVICE_MANAGED"
  protocols              = ["SFTP"]
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_transfer_server" "pass_ftps" {
  identity_provider_type = "SERVICE_MANAGED"
  protocols              = ["FTPS"]
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_transfer_server" "pass_multiple_secure" {
  identity_provider_type = "SERVICE_MANAGED"
  protocols              = ["SFTP", "FTPS"]
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_transfer_server" "pass_default" {
  identity_provider_type = "SERVICE_MANAGED"
  # No protocols specified (defaults to SFTP only)
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_transfer_server" "fail_ftp" {
  identity_provider_type = "SERVICE_MANAGED"
  protocols              = ["FTP"]
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_transfer_server" "fail_mixed" {
  identity_provider_type = "SERVICE_MANAGED"
  protocols              = ["SFTP", "FTP"]
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
