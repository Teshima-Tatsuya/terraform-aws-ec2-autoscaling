resource "aws_eip" "nat-a" {
    tags = {
      Name = "teshima-eip-nat-a"
    }
}

resource "aws_eip" "nat-c" {
    tags = {
      Name = "teshima-eip-nat-c"
    }
}