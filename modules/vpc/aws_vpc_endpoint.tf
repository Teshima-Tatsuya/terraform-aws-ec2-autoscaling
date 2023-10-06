resource "aws_vpc_endpoint" "all" {
    for_each = var.vpc_endpoint

    vpc_id = aws_vpc.main.id
    service_name = each.key
    private_dns_enabled = true
    vpc_endpoint_type = "Interface"
    security_group_ids = [aws_security_group.all["teshima-sg-vpce"].id]

    subnet_ids = [
        aws_subnet.all[each.value.subnet].id
    ]

    tags = {
        Name = "teshima-${each.key}"
    }
}