resource "awscc_ec2_vpc" "pass_150" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = [
    {
      key   = "Name"
      value = "example-vpc"
    }
  ]
}

resource "awscc_ec2_flow_log" "pass_150" {
  resource_type = "VPC"
  resource_ids  = [awscc_ec2_vpc.pass_150.id]
  traffic_type  = "ALL"

  log_destination_type = "cloud-watch-logs"
  log_group_name       = "/aws/vpc/flowlogs"

  tags = [
    {
      key   = "Name"
      value = "example-flow-log"
    }
  ]
}
