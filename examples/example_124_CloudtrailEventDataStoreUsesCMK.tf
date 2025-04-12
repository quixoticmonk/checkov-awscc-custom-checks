# pass - using CMK
resource "awscc_cloudtrail_event_data_store" "pass" {
  name                   = "example-event-data-store"
  multi_region_enabled   = true
  organization_enabled   = false
  retention_period       = 90
  termination_protection = true
  kms_key_id             = "arn:aws:kms:us-east-1:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
}

# fail - no KMS key specified
resource "awscc_cloudtrail_event_data_store" "fail" {
  name                   = "example-event-data-store-no-cmk"
  multi_region_enabled   = true
  organization_enabled   = false
  retention_period       = 90
  termination_protection = true
}
