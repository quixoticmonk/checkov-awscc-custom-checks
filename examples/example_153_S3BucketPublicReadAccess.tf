resource "awscc_s3_bucket" "pass_153" {
  bucket_name = "example-blocked-bucket-153"

  public_access_block_configuration = {
    block_public_acls       = true
    ignore_public_acls      = true
    block_public_policy     = true
    restrict_public_buckets = true
  }
}

resource "awscc_s3_bucket" "fail_153" {
  bucket_name = "example-no-block-bucket-153"
}

resource "awscc_s3_bucket" "fail2_153" {
  bucket_name = "example-partial-block-bucket-153"

  public_access_block_configuration = {
    block_public_acls       = true
    ignore_public_acls      = false
    block_public_policy     = true
    restrict_public_buckets = true
  }
}
