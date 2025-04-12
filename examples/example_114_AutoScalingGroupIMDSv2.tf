# pass

resource "awscc_autoscaling_auto_scaling_group" "pass" {
  auto_scaling_group_name = "example-asg-imdsv2"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  health_check_type      = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier    = ["subnet-12345678", "subnet-87654321"]
  
  # Using launch template with IMDSv2 configured
  launch_template = {
    launch_template_specification = {
      launch_template_id = "lt-0123456789abcdef0"
      version = "$Latest"
    }
  }
  
  tags = [
    {
      key                 = "Name"
      value               = "example-asg-imdsv2"
      propagate_at_launch = true
    }
  ]
}

resource "awscc_autoscaling_auto_scaling_group" "pass2" {
  auto_scaling_group_name = "example-asg-imdsv2-mixed"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  health_check_type      = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier    = ["subnet-12345678", "subnet-87654321"]
  
  # Using mixed instances policy with launch template that has IMDSv2 configured
  mixed_instances_policy = {
    launch_template = {
      launch_template_specification = {
        launch_template_id = "lt-0123456789abcdef0"
        version = "$Latest"
      }
    }
  }
  
  tags = [
    {
      key                 = "Name"
      value               = "example-asg-imdsv2-mixed"
      propagate_at_launch = true
    }
  ]
}

# fail

resource "awscc_autoscaling_auto_scaling_group" "fail" {
  auto_scaling_group_name = "example-asg-no-imdsv2"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 2
  health_check_type      = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier    = ["subnet-12345678", "subnet-87654321"]
  
  # No launch template specified, using launch configuration instead
  launch_configuration_name = "example-launch-config"
  
  tags = [
    {
      key                 = "Name"
      value               = "example-asg-no-imdsv2"
      propagate_at_launch = true
    }
  ]
}
