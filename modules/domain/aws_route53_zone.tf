resource "aws_route53_zone" "dev" {
    name = "aws.tessy.dev"

    lifecycle {
      prevent_destroy = true
    }
}