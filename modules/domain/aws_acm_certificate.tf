resource "aws_acm_certificate" "dev" {
  domain_name = "aws.tessy.dev"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "aws.tessy.dev"
  }
}

# data "aws_acm_certificate" "sub" {
#     domain = "sub.teshiblog.com"
# }