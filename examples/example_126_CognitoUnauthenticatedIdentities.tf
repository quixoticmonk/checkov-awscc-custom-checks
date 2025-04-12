# pass - explicitly disallow unauthenticated identities
resource "awscc_cognito_identity_pool" "pass" {
  identity_pool_name               = "example_identity_pool"
  allow_unauthenticated_identities = false
  cognito_identity_providers       = [
    {
      client_id               = "client-id-example",
      provider_name           = "cognito-idp.us-east-1.amazonaws.com/us-east-1_example",
      server_side_token_check = false
    }
  ]
}

# pass - default behavior (not specified)
resource "awscc_cognito_identity_pool" "pass_default" {
  identity_pool_name         = "example_identity_pool_default"
  cognito_identity_providers = [
    {
      client_id               = "client-id-example",
      provider_name           = "cognito-idp.us-east-1.amazonaws.com/us-east-1_example",
      server_side_token_check = false
    }
  ]
}

# fail - explicitly allow unauthenticated identities
resource "awscc_cognito_identity_pool" "fail" {
  identity_pool_name               = "example_identity_pool_fail"
  allow_unauthenticated_identities = true
  cognito_identity_providers       = [
    {
      client_id               = "client-id-example",
      provider_name           = "cognito-idp.us-east-1.amazonaws.com/us-east-1_example",
      server_side_token_check = false
    }
  ]
}
