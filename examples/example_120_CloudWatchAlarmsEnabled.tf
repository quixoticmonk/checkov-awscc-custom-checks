# pass - actions_enabled explicitly set to true
resource "awscc_cloudwatch_alarm" "pass" {
  alarm_name          = "cpu-utilization-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This alarm monitors EC2 CPU utilization"
  actions_enabled     = true
  alarm_actions       = ["arn:aws:sns:us-east-1:123456789012:my-topic"]
  dimensions          = {
    InstanceId = "i-12345678"
  }
}

# pass - actions_enabled not specified (defaults to true)
resource "awscc_cloudwatch_alarm" "pass_default" {
  alarm_name          = "cpu-utilization-alarm-default"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This alarm monitors EC2 CPU utilization"
  alarm_actions       = ["arn:aws:sns:us-east-1:123456789012:my-topic"]
  dimensions          = {
    InstanceId = "i-12345678"
  }
}

# fail - actions_enabled explicitly set to false
resource "awscc_cloudwatch_alarm" "fail" {
  alarm_name          = "cpu-utilization-alarm-disabled"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This alarm monitors EC2 CPU utilization but actions are disabled"
  actions_enabled     = false
  alarm_actions       = ["arn:aws:sns:us-east-1:123456789012:my-topic"]
  dimensions          = {
    InstanceId = "i-12345678"
  }
}
