data "aws_ssm_parameter" "amzn2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2022-ami-kernel-5.15-x86_64"
}