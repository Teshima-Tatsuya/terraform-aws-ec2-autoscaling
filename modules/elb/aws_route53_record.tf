resource "aws_route53_record" "main" {
    zone_id = var.route53.zone.zone_id
    name = "asg.${var.route53.zone.name}"
    type = "A"

    alias {
      name = aws_lb.alb.dns_name
      zone_id = aws_lb.alb.zone_id
      evaluate_target_health = true
    }
}