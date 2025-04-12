# pass

resource "awscc_autoscaling_auto_scaling_group" "pass" {
  auto_scaling_group_name = "example-asg"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  health_check_type      = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier    = ["subnet-12345678", "subnet-87654321"]
  
  tags = [
    {
      key                 = "Name"
      value               = "example-asg"
      propagate_at_launch = true
    }
  ]
}

# fail

resource "awscc_autoscaling_auto_scaling_group" "fail" {
  auto_scaling_group_name = "example-asg-fail"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  health_check_type      = "EC2"  # Using EC2 health check instead of ELB
  health_check_grace_period = 300
  vpc_zone_identifier    = ["subnet-12345678", "subnet-87654321"]
  
  tags = [
    {
      key                 = "Name"
      value               = "example-asg-fail"
      propagate_at_launch = true
    }
  ]
}

resource "awscc_autoscaling_auto_scaling_group" "fail2" {
  auto_scaling_group_name = "example-asg-fail2"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  # No health_check_type specified, defaults to EC2
  health_check_grace_period = 300
  vpc_zone_identifier    = ["subnet-12345678", "subnet-87654321"]
  
  tags = [
    {
      key                 = "Name"
      value               = "example-asg-fail2"
      propagate_at_launch = true
    }
  ]
}
