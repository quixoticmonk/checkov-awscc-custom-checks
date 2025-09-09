resource "awscc_ec2_snapshot" "pass_148" {
  volume_id   = "vol-1234567890abcdef0"
  description = "Private snapshot example"
}

resource "awscc_ec2_snapshot" "pass2_148" {
  volume_id   = "vol-1234567890abcdef1"
  description = "Private snapshot with explicit permissions"

  create_volume_permissions = [
    {
      user_id = "123456789012"
    }
  ]
}

resource "awscc_ec2_snapshot" "fail_148" {
  volume_id   = "vol-1234567890abcdef2"
  description = "Public snapshot example"

  create_volume_permissions = [
    {
      group = "all"
    }
  ]
}

resource "awscc_ec2_snapshot" "fail2_148" {
  volume_id   = "vol-1234567890abcdef3"
  description = "Mixed permissions snapshot"

  create_volume_permissions = [
    {
      user_id = "123456789012"
    },
    {
      group = "all"
    }
  ]
}
