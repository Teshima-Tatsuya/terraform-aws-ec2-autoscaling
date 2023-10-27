resource "aws_acm_certificate" "dev" {
  domain_name = "*.aws.tessy.dev"
  validation_method = "DNS"
}