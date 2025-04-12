resource "awscc_ec2_vpc_endpoint_service" "pass" {
  network_load_balancer_arns = ["arn:aws:elasticloadbalancing:us-west-2:123456789012:loadbalancer/net/my-nlb/1234567890abcdef"]
  acceptance_required        = true
  
  tags = [
    {
      key   = "Environment"
      value = "Production"
    }
  ]
}

resource "awscc_ec2_vpc_endpoint_service" "fail" {
  network_load_balancer_arns = ["arn:aws:elasticloadbalancing:us-west-2:123456789012:loadbalancer/net/my-nlb/1234567890abcdef"]
  acceptance_required        = false
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}

resource "awscc_ec2_vpc_endpoint_service" "fail2" {
  network_load_balancer_arns = ["arn:aws:elasticloadbalancing:us-west-2:123456789012:loadbalancer/net/my-nlb/1234567890abcdef"]
  # acceptance_required not specified (defaults to false)
  
  tags = [
    {
      key   = "Environment"
      value = "Development"
    }
  ]
}
