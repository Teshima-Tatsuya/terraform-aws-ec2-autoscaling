resource "aws_iam_instance_profile" "teshima-ssm-access" {
    name = "teshima-ssm-access"
    role = aws_iam_role.teshima-ssm-access.name
}