resource "aws_acm_certificate_validation" "dev" {
  certificate_arn = aws_acm_certificate.dev.arn
  validation_record_fqdns = [for record in aws_route53_record.cert : record.fqdn]

  lifecycle {
    prevent_destroy = true
  }
}