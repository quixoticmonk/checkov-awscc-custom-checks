resource "awscc_timestream_database" "pass" {
  database_name = "secure-timestream-database"
  kms_key_id    = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_timestream_database" "fail" {
  database_name = "insecure-timestream-database"
  # No KMS key specified (uses default AWS managed key)
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
