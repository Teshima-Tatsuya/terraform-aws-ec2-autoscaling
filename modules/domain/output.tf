output "acm" {
  value = {
    acm = aws_acm_certificate.dev
  }
}

output "route53" {
  value = {
    zone = aws_route53_zone.dev
  }
}