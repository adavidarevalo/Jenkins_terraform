terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.58"
    }
  }
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
  azs      = local.azs
  name     = "${local.name}-vpc"
  tags     = local.tags
}

module "jenkins" {
  source = "./modules/jenkins"

    depends_on = [module.vpc]

  key_pair_name = var.hostBastion_key_pair_name

  key_pair_path = local.hostBastion_key_pair_path

  ingress_cidr_blocks = var.hostBastion_ingress_cidr_blocks
  vpc_id              = module.vpc.vpc_id

  tags = local.tags

  ami_id    = local.ami_id
  subnet_id = module.vpc.vpc_public_subnet_ids[0]

  public_subnets = module.vpc.vpc_public_subnet_ids

    route53_zone_id      = local.route53_zoneId
  domain_name = trimsuffix(data.aws_route53_zone.myDomain.name, ".")

acm_certificate_arn = module.acm.acm_certificate_arn
}