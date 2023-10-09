# resource "aws_route53_record" "main" {
#     zone_id = aws_route53_zone.dev.zone_id
#     name = aws_route53_zone.dev.name
#     type = "A"

#     alias {
#       name = var.elb.alb.dns_name
#       zone_id = var.elb.alb.zone_id
#       evaluate_target_health = true
#     }
# }