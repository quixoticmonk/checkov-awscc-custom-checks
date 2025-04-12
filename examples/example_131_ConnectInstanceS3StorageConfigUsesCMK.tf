# pass - S3 storage config with CMK
resource "awscc_connect_instance_storage_config" "pass" {
  instance_id  = "12345678-1234-1234-1234-123456789012"
  resource_type = "CHAT_TRANSCRIPTS"
  storage_type  = "S3"
  s3_config = {
    bucket_name = "connect-transcripts-bucket"
    bucket_prefix = "transcripts"
    encryption_config = {
      key_id = "arn:aws:kms:us-east-1:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
      encryption_type = "KMS"
    }
  }
}

# fail - S3 storage config without encryption
resource "awscc_connect_instance_storage_config" "fail" {
  instance_id  = "12345678-1234-1234-1234-123456789012"
  resource_type = "CHAT_TRANSCRIPTS"
  storage_type  = "S3"
  s3_config = {
    bucket_name = "connect-transcripts-bucket"
    bucket_prefix = "transcripts"
  }
}

# pass - Not an S3 storage config (not applicable)
resource "awscc_connect_instance_storage_config" "pass_not_applicable" {
  instance_id  = "12345678-1234-1234-1234-123456789012"
  resource_type = "CHAT_RECORDINGS"
  storage_type  = "KINESIS_VIDEO_STREAM"
  kinesis_video_stream_config = {
    prefix                 = "connect-recordings"
    retention_period_hours = 24
  }
}
