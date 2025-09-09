resource "awscc_s3_bucket" "pass_154" {
  bucket_name = "example-ssl-enforced-bucket-154"

  bucket_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyInsecureConnections"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          "arn:aws:s3:::example-ssl-enforced-bucket-154",
          "arn:aws:s3:::example-ssl-enforced-bucket-154/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}

resource "awscc_s3_bucket" "fail_154" {
  bucket_name = "example-no-ssl-policy-bucket-154"
}

resource "awscc_s3_bucket" "fail2_154" {
  bucket_name = "example-insufficient-policy-bucket-154"

  bucket_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowPublicRead"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::example-insufficient-policy-bucket-154/*"
      }
    ]
  })
}
