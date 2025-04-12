# pass - logging explicitly enabled
resource "awscc_cloudtrail_trail" "pass" {
  name                          = "example-trail"
  s3_bucket_name                = "example-cloudtrail-bucket"
  is_logging                    = true
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
}

# fail - logging explicitly disabled
resource "awscc_cloudtrail_trail" "fail_disabled" {
  name                          = "example-trail-disabled"
  s3_bucket_name                = "example-cloudtrail-bucket"
  is_logging                    = false
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
}

# fail - logging not specified (defaults to false)
resource "awscc_cloudtrail_trail" "fail_default" {
  name                          = "example-trail-default"
  s3_bucket_name                = "example-cloudtrail-bucket"
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
}
