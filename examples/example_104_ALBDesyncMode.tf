resource "awscc_elasticloadbalancingv2_load_balancer" "pass_defensive" {
  name               = "secure-alb-defensive"
  type               = "application"
  ip_address_type    = "ipv4"
  security_groups    = ["sg-12345678"]
  subnets            = ["subnet-12345678", "subnet-87654321"]
  
  attributes = [
    {
      key   = "routing.http.desync_mitigation_mode"
      value = "defensive"
    }
  ]
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_elasticloadbalancingv2_load_balancer" "pass_strictest" {
  name               = "secure-alb-strictest"
  type               = "application"
  ip_address_type    = "ipv4"
  security_groups    = ["sg-12345678"]
  subnets            = ["subnet-12345678", "subnet-87654321"]
  
  attributes = [
    {
      key   = "routing.http.desync_mitigation_mode"
      value = "strictest"
    }
  ]
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_elasticloadbalancingv2_load_balancer" "pass_default" {
  name               = "secure-alb-default"
  type               = "application"
  ip_address_type    = "ipv4"
  security_groups    = ["sg-12345678"]
  subnets            = ["subnet-12345678", "subnet-87654321"]
  
  # No attributes specified (defaults to 'defensive')
  
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
  
  # Desync mitigation mode not applicable for NLB
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_elasticloadbalancingv2_load_balancer" "fail" {
  name               = "insecure-alb"
  type               = "application"
  ip_address_type    = "ipv4"
  security_groups    = ["sg-12345678"]
  subnets            = ["subnet-12345678", "subnet-87654321"]
  
  attributes = [
    {
      key   = "routing.http.desync_mitigation_mode"
      value = "monitor"  # Insecure mode
    }
  ]
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
