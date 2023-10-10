resource "aws_autoscaling_policy" "web-server_cpu" {
  name                   = "web-server_cpu"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 90
  autoscaling_group_name = aws_autoscaling_group.web.name
}
