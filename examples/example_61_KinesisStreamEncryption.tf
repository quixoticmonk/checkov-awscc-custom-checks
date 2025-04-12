resource "awscc_kinesis_stream" "pass" {
  name = "example-kinesis-stream"
  retention_period_hours = 24
  shard_count = 3
  
  stream_encryption = {
    encryption_type = "KMS"
    key_id = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
  }
  
  tags = {
    Environment = "Production"
    Owner = "Data Team"
  }
}

resource "awscc_kinesis_stream" "fail_no_encryption" {
  name = "example-kinesis-stream"
  retention_period_hours = 24
  shard_count = 3
  
  tags = {
    Environment = "Development"
    Owner = "Data Team"
  }
}
