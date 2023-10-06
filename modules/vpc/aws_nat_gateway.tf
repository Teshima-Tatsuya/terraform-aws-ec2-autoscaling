resource "aws_nat_gateway" "pub-a" {
    allocation_id = aws_eip.nat-a.id
    subnet_id = aws_subnet.all["teshima-subnet-pub-a"].id

    tags = {
      Name = "teshima-nat-pub-a"
    }

    depends_on = [
      aws_internet_gateway.main
    ]
}

resource "aws_nat_gateway" "pub-c" {
    allocation_id = aws_eip.nat-c.id
    subnet_id = aws_subnet.all["teshima-subnet-pub-c"].id

    tags = {
      Name = "teshima-nat-pub-c"
    }

    depends_on = [
      aws_internet_gateway.main
    ]
}