resource "aws_iam_role_policy_attachment" "teshima-ssm-access" {
  role       = aws_iam_role.teshima-ssm-access.name
  policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}