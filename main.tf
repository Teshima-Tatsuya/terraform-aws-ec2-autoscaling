module "domain" {
  source = "./modules/domain"
}

module "web-server" {
  source = "./modules/web-server"

  vpc = module.vpc.vpc
  iam = module.iam.iam
  elb = module.elb.elb
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr     = var.vpc_cidr
  vpc_subnet   = var.vpc_subnet
  vpc_endpoint = var.vpc_endpoint
  route        = var.route
  sg           = var.sg
  sg_rule      = var.sg_rule
}

module "iam" {
  source = "./modules/iam"
}

module "elb" {
  source = "./modules/elb"

  vpc = module.vpc.vpc
  route53 = module.domain.route53
  acm = module.domain.acm
}