resource "aws_launch_template" "web" {
  name        = "teshima-lt-web"
  description = "launch template for web"

  image_id      = data.aws_ssm_parameter.amzn2_ami.value
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.teshima-keypair.key_name
  iam_instance_profile {
    name = var.iam.profile.name
  }
  vpc_security_group_ids = [var.vpc.sg.teshima-sg-web.id]

  user_data = base64encode(<<-EOL
      #!/bin/bash 

      yum install httpd -y
      systemctl start httpd
      systemctl enable httpd

      yum install amzon-cloudwatch-agent
    EOL
  )

  update_default_version = true

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name       = "teshima-web"
      ServerType = "Web"
    }
  }
}