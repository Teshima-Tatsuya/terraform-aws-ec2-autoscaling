data "aws_iam_policy" "AmazonSSMManagedInstanceCore" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_policy" "web-server" {
  name = "web-server"
  policy = data.aws_iam_policy_document.web-server.json
}