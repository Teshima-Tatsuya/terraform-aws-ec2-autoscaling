variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "vpc_subnet" {
  default = {
    "teshima-subnet-pub-a" = {
      cidr_block_host = 2
      cidr_block_bit  = 2
      az              = "ap-northeast-1a"
    },
    "teshima-subnet-pub-c" = {
      cidr_block_host = 2
      cidr_block_bit  = 3
      az              = "ap-northeast-1c"
    },
    "teshima-subnet-pri-a" = {
      cidr_block_host = 2
      cidr_block_bit  = 0
      az              = "ap-northeast-1a"
    },
    "teshima-subnet-pri-c" = {
      cidr_block_host = 2
      cidr_block_bit  = 1
      az              = "ap-northeast-1c"
    }
  }
}

variable "vpc_endpoint" {
  default = {
    "com.amazonaws.ap-northeast-1.ssm" = {
      subnet = "teshima-subnet-pri-a"
    },
    "com.amazonaws.ap-northeast-1.ssmmessages" = {
      subnet = "teshima-subnet-pri-a"
    },
    "com.amazonaws.ap-northeast-1.ec2messages" = {
      subnet = "teshima-subnet-pri-a"
    }
  }
}

variable "route" {
  default = {
    "teshima-rt-subnet-pub-a" = {
      subnet = "teshima-subnet-pub-a"
      dest_cidr = "0.0.0.0/0"
      igw = true
    },
    "teshima-rt-subnet-pub-c" = {
      subnet = "teshima-subnet-pub-c"
      dest_cidr = "0.0.0.0/0"
      igw = true
    },
    "teshima-rt-subnet-pri-a" = {
      subnet = "teshima-subnet-pri-a"
      igw = false
    },
    "teshima-rt-subnet-pri-c" = {
      subnet = "teshima-subnet-pri-c"
      igw = false
    }
  }
}

variable "sg" {
  default = {
    "teshima-sg-alb" = {
      description = "for alb"
    },
    "teshima-sg-vpce" = {
      description = "for vpce"
    },
    "teshima-sg-web" = {
      description = "for web server"
    }
  }
}

variable "sg_rule" {
  default = {
    "teshima-sg-alb-egress" = {
        sg = "teshima-sg-alb"
        type = "egress"
        description = "egress all"
        from = -1
        to = -1
        protocol = "ALL"
        cidr = "0.0.0.0/0"
    },
    "teshima-sg-alb-ingress-http" = {
        sg = "teshima-sg-alb"
        type = "ingress"
        description = "http"
        from = 80
        to = 80
        protocol = "TCP"
        cidr = "0.0.0.0/0"
    },
    "teshima-sg-alb-ingress-https" = {
        sg = "teshima-sg-alb"
        type = "ingress"
        description = "https"
        from = 443
        to = 443
        protocol = "TCP"
        cidr = "0.0.0.0/0"
    },
    "teshima-sg-vpce-ingress-https" = {
        sg = "teshima-sg-vpce"
        type = "ingress"
        description = "https"
        from = 443
        to = 443
        protocol = "TCP"
        cidr = "10.1.0.0/16"
    },
    "teshima-sg-web-egress" = {
        sg = "teshima-sg-web"
        type = "egress"
        description = "egress all"
        from = -1
        to = -1
        protocol = "ALL"
        cidr = "0.0.0.0/0"
    },
    "teshima-sg-web-ingress-http" = {
        sg = "teshima-sg-web"
        type = "ingress"
        description = "http"
        from = 80
        to = 80
        protocol = "TCP"
        cidr = "0.0.0.0/0"
    },
    "teshima-sg-web-ingress-https" = {
        sg = "teshima-sg-web"
        type = "ingress"
        description = "http"
        from = 443
        to = 443
        protocol = "TCP"
        cidr = "0.0.0.0/0"
    }
  }
}