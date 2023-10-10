resource "aws_cloudwatch_metric_alarm" "cpu" {
  alarm_name          = "CPUUtilization_websrv"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  datapoints_to_alarm = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 15

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web.name
  }

  alarm_actions     = [aws_autoscaling_policy.web-server_cpu.arn]
}
