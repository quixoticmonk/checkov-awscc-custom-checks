# pass

resource "awscc_autoscaling_auto_scaling_group" "pass" {
  auto_scaling_group_name = "example-asg-tags"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  health_check_type      = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier    = ["subnet-12345678", "subnet-87654321"]
  
  # Tags with propagate_at_launch set to true
  tags = [
    {
      key                 = "Name"
      value               = "example-asg-tags"
      propagate_at_launch = true
    },
    {
      key                 = "Environment"
      value               = "Production"
      propagate_at_launch = true
    }
  ]
}

# fail

resource "awscc_autoscaling_auto_scaling_group" "fail" {
  auto_scaling_group_name = "example-asg-no-tag-propagation"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  health_check_type      = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier    = ["subnet-12345678", "subnet-87654321"]
  
  # Tags with propagate_at_launch set to false
  tags = [
    {
      key                 = "Name"
      value               = "example-asg-no-tag-propagation"
      propagate_at_launch = false
    },
    {
      key                 = "Environment"
      value               = "Production"
      propagate_at_launch = false
    }
  ]
}

resource "awscc_autoscaling_auto_scaling_group" "fail2" {
  auto_scaling_group_name = "example-asg-no-tags"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  health_check_type      = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier    = ["subnet-12345678", "subnet-87654321"]
  
  # No tags defined
}
