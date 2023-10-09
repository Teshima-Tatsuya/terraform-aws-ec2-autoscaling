resource "aws_lb" "alb" {
    name = "teshima-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [ var.vpc.sg.teshima-sg-alb.id ]

    subnets = [var.vpc.subnet.teshima-subnet-pub-a.id, var.vpc.subnet.teshima-subnet-pub-c.id]

}