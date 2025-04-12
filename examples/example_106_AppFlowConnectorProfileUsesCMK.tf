resource "awscc_appflow_connector_profile" "pass" {
  connector_profile_name = "secure-connector-profile"
  connector_type         = "Salesforce"
  
  connection_mode = "Public"
  kms_arn         = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
  
  connector_profile_config = {
    connector_profile_properties = {
      salesforce = {
        instance_url = "https://example.salesforce.com"
        is_sandbox   = false
      }
    }
    connector_profile_credentials = {
      salesforce = {
        access_token = "EXAMPLE-ACCESS-TOKEN"
        oauth2_grant_type = "CLIENT_CREDENTIALS"
        client_id = "EXAMPLE-CLIENT-ID"
        client_secret = "EXAMPLE-CLIENT-SECRET"
      }
    }
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_appflow_connector_profile" "fail" {
  connector_profile_name = "insecure-connector-profile"
  connector_type         = "Salesforce"
  
  connection_mode = "Public"
  # No KMS key specified (uses default AWS managed key)
  
  connector_profile_config = {
    connector_profile_properties = {
      salesforce = {
        instance_url = "https://example.salesforce.com"
        is_sandbox   = false
      }
    }
    connector_profile_credentials = {
      salesforce = {
        access_token = "EXAMPLE-ACCESS-TOKEN"
        oauth2_grant_type = "CLIENT_CREDENTIALS"
        client_id = "EXAMPLE-CLIENT-ID"
        client_secret = "EXAMPLE-CLIENT-SECRET"
      }
    }
  }
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
