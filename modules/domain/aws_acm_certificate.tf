resource "aws_acm_certificate" "dev" {
  domain_name = "*.tessy.dev"
  validation_method = "DNS"

  lifecycle {
    prevent_destroy = true
  }
}