resource "aws_acm_certificate" "dev" {
  domain_name = "aws.tessy.dev"
  validation_method = "DNS"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "aws.tessy.dev"
  }
}