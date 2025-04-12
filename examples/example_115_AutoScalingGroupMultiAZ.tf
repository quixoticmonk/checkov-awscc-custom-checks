# pass

resource "awscc_autoscaling_auto_scaling_group" "pass" {
  auto_scaling_group_name = "example-asg-multi-az"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  health_check_type      = "ELB"
  health_check_grace_period = 300
  
  # Multiple subnets across different AZs
  vpc_zone_identifier    = ["subnet-12345678", "subnet-87654321"]
  
  tags = [
    {
      key                 = "Name"
      value               = "example-asg-multi-az"
      propagate_at_launch = true
    }
  ]
}

resource "awscc_autoscaling_auto_scaling_group" "pass2" {
  auto_scaling_group_name = "example-asg-multi-az-2"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  health_check_type      = "ELB"
  health_check_grace_period = 300
  
  # Multiple availability zones specified directly
  availability_zones     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  
  tags = [
    {
      key                 = "Name"
      value               = "example-asg-multi-az-2"
      propagate_at_launch = true
    }
  ]
}

# fail

resource "awscc_autoscaling_auto_scaling_group" "fail" {
  auto_scaling_group_name = "example-asg-single-az"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  health_check_type      = "ELB"
  health_check_grace_period = 300
  
  # Only one subnet in a single AZ
  vpc_zone_identifier    = ["subnet-12345678"]
  
  tags = [
    {
      key                 = "Name"
      value               = "example-asg-single-az"
      propagate_at_launch = true
    }
  ]
}

resource "awscc_autoscaling_auto_scaling_group" "fail2" {
  auto_scaling_group_name = "example-asg-single-az-2"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  health_check_type      = "ELB"
  health_check_grace_period = 300
  
  # Only one availability zone
  availability_zones     = ["us-east-1a"]
  
  tags = [
    {
      key                 = "Name"
      value               = "example-asg-single-az-2"
      propagate_at_launch = true
    }
  ]
}
