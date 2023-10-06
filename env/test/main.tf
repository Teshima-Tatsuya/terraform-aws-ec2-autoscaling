module "web-server" {
  source = "../../modules/web-server"

  vpc = module.vpc.vpc
  iam = module.iam.iam
  elb = module.elb.elb
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr     = var.vpc_cidr
  vpc_subnet   = var.vpc_subnet
  vpc_endpoint = var.vpc_endpoint
  route        = var.route
  sg           = var.sg
  sg_rule      = var.sg_rule
}

module "kms" {
  source = "../../modules/kms"
}

module "iam" {
  source = "../../modules/iam"
}

module "elb" {
  source = "../../modules/elb"

  vpc = module.vpc.vpc
  acm = module.acm.acm
}