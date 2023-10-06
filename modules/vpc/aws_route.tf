locals {
  pub = {
    "teshima-rt-subnet-pub-a" = {
        dest_cidr = "0.0.0.0/0"
    },
    "teshima-rt-subnet-pub-c" = {
        dest_cidr = "0.0.0.0/0"
    }
  }
}

resource "aws_route" "pub" {
    for_each = local.pub

    route_table_id = aws_route_table.all[each.key].id
    destination_cidr_block = each.value.dest_cidr
    gateway_id = aws_internet_gateway.main.id
}

resource "aws_route" "pri-a" {
    route_table_id = aws_route_table.all["teshima-rt-subnet-pri-a"].id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.pub-a.id
}

resource "aws_route" "pri-c" {
    route_table_id = aws_route_table.all["teshima-rt-subnet-pri-c"].id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.pub-c.id
}