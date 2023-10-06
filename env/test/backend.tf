terraform {
  cloud {
    hostname = "app.terraform.io"
    workspaces {
      name = "terraform-aws-ec2-autoscaling"
    }
  }
}