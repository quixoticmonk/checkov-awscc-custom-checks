resource "awscc_efs_access_point" "pass" {
  file_system_id = "fs-12345678"
  
  posix_user = {
    uid = 1000
    gid = 1000
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
  
  # No posix_user specified
  
  tags = [
    {
      key   = "Name"
      value = "insecure-access-point"
    }
  ]
}

resource "awscc_efs_access_point" "fail2" {
  file_system_id = "fs-12345678"
  
  posix_user = {
    # Missing uid
    gid = 1000
  }
  
  tags = [
    {
      key   = "Name"
      value = "incomplete-user-identity"
    }
  ]
}
