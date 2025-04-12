# pass - using variable references for sensitive data
resource "awscc_datasync_location_object_storage" "pass" {
  server_hostname = "storage.example.com"
  bucket_name     = "example-bucket"
  server_port     = 443
  server_protocol = "HTTPS"
  access_key      = "AKIAIOSFODNN7EXAMPLE"
  secret_key      = "${var.secret_key}"
  agent_arns      = ["arn:aws:datasync:us-east-1:123456789012:agent/agent-0123456789abcdef0"]
}

# pass - using variable reference for server certificate
resource "awscc_datasync_location_object_storage" "pass_cert" {
  server_hostname    = "storage.example.com"
  bucket_name        = "example-bucket"
  server_port        = 443
  server_protocol    = "HTTPS"
  access_key         = "AKIAIOSFODNN7EXAMPLE"
  secret_key         = "${var.secret_key}"
  server_certificate = "${var.server_certificate}"
  agent_arns         = ["arn:aws:datasync:us-east-1:123456789012:agent/agent-0123456789abcdef0"]
}

# fail - hardcoded secret key
resource "awscc_datasync_location_object_storage" "fail_secret" {
  server_hostname = "storage.example.com"
  bucket_name     = "example-bucket"
  server_port     = 443
  server_protocol = "HTTPS"
  access_key      = "AKIAIOSFODNN7EXAMPLE"
  secret_key      = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
  agent_arns      = ["arn:aws:datasync:us-east-1:123456789012:agent/agent-0123456789abcdef0"]
}

# fail - hardcoded server certificate
resource "awscc_datasync_location_object_storage" "fail_cert" {
  server_hostname    = "storage.example.com"
  bucket_name        = "example-bucket"
  server_port        = 443
  server_protocol    = "HTTPS"
  access_key         = "AKIAIOSFODNN7EXAMPLE"
  secret_key         = "${var.secret_key}"
  server_certificate = "-----BEGIN CERTIFICATE-----\nMIIDQzCCAiugAwIBAgIJAOd1tlfiGoEoMA0GCSqGSIb3DQEBCwUAMDgxCzAJBgNV\n-----END CERTIFICATE-----"
  agent_arns         = ["arn:aws:datasync:us-east-1:123456789012:agent/agent-0123456789abcdef0"]
}
