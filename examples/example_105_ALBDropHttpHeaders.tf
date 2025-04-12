resource "awscc_elasticloadbalancingv2_load_balancer" "pass" {
  name               = "secure-alb"
  type               = "application"
  ip_address_type    = "ipv4"
  security_groups    = ["sg-12345678"]
  subnets            = ["subnet-12345678", "subnet-87654321"]
  
  attributes = [
    {
      key   = "routing.http.drop_invalid_header_fields.enabled"
      value = "true"
    }
  ]
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_elasticloadbalancingv2_load_balancer" "pass_nlb" {
  name               = "network-lb"
  type               = "network"
  ip_address_type    = "ipv4"
  subnets            = ["subnet-12345678", "subnet-87654321"]
  
  # Drop invalid header fields not applicable for NLB
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_elasticloadbalancingv2_load_balancer" "fail_explicit" {
  name               = "insecure-alb"
  type               = "application"
  ip_address_type    = "ipv4"
  security_groups    = ["sg-12345678"]
  subnets            = ["subnet-12345678", "subnet-87654321"]
  
  attributes = [
    {
      key   = "routing.http.drop_invalid_header_fields.enabled"
      value = "false"
    }
  ]
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_elasticloadbalancingv2_load_balancer" "fail_default" {
  name               = "insecure-alb-default"
  type               = "application"
  ip_address_type    = "ipv4"
  security_groups    = ["sg-12345678"]
  subnets            = ["subnet-12345678", "subnet-87654321"]
  
  # No attributes specified for drop_invalid_header_fields (defaults to false)
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
