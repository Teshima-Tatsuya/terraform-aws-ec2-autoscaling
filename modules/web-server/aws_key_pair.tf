resource "tls_private_key" "teshima-AmazonLinux2" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "teshima-AmazonLinux2-pem" {
  filename        = "./teshima-AmazonLinux2.id_rsa"
  content         = tls_private_key.teshima-AmazonLinux2.private_key_pem
  file_permission = 600
}

resource "local_file" "teshima-AmazonLinux2-pub" {
  filename        = "./teshima-AmazonLinux2.id_rsa.pub"
  content         = tls_private_key.teshima-AmazonLinux2.public_key_openssh
  file_permission = 600
}

resource "aws_key_pair" "teshima-AmazonLinux2" {
  key_name   = "teshima-AmazonLinux2-key"
  public_key = tls_private_key.teshima-AmazonLinux2.public_key_openssh
}