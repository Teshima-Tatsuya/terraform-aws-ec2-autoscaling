resource "aws_iam_role" "teshima-ssm-access" {
  name               = "teshima-ssm-access"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.teshima-ssm-access.json
}