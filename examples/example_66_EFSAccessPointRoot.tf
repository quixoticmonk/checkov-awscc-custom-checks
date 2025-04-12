resource "awscc_efs_access_point" "pass" {
  file_system_id = "fs-12345678"
  
  root_directory = {
    path = "/custom-directory"
    creation_info = {
      owner_gid   = 1000
      owner_uid   = 1000
      permissions = "755"
    }
  }
  
  tags = [
    {
      key   = "Name"
      value = "secure-access-point"
    }
  ]
}

resource "awscc_efs_access_point" "fail" {
  file_system_id = "fs-12345678"
  
  root_directory = {
    path = "/"  # Default root path
  }
  
  tags = [
    {
      key   = "Name"
      value = "insecure-access-point"
    }
  ]
}

resource "awscc_efs_access_point" "fail2" {
  file_system_id = "fs-12345678"
  
  # No root_directory specified
  
  tags = [
    {
      key   = "Name"
      value = "no-root-directory"
    }
  ]
}
