output "iam" {
  value = {
    "role" = aws_iam_role.teshima-ssm-access
    "profile" = aws_iam_instance_profile.teshima-ssm-access
  }
}