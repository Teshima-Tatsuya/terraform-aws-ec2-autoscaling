resource "aws_iam_role_policy_attachment" "web-server_ssm" {
  role       = aws_iam_role.web-server.name
  policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}

resource "aws_iam_role_policy_attachment" "web-server_cloudwatch" {
  role       = aws_iam_role.web-server.name
  policy_arn = data.aws_iam_policy.CloudWatchAgentServerPolicy.arn
}
resource "aws_iam_role_policy_attachment" "web-server_ssm_parameter" {
  role       = aws_iam_role.web-server.name
  policy_arn = aws_iam_policy.web-server.arn
}