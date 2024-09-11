module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.12.1"

  name = var.name
  cidr = var.vpc_cidr

  azs              = var.azs
  private_subnets  = [for k, v in var.azs : cidrsubnet(var.vpc_cidr, 8, k)]
  public_subnets   = [for k, v in var.azs : cidrsubnet(var.vpc_cidr, 8, k + 4)]
  database_subnets = [for k, v in var.azs : cidrsubnet(var.vpc_cidr, 8, k + 8)]

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_vpn_gateway = true

  enable_dhcp_options = true

  vpc_flow_log_iam_role_name                = "vpc-${var.name}-role"
  vpc_flow_log_iam_role_use_name_prefix     = false
  enable_flow_log                           = true
  create_flow_log_cloudwatch_log_group      = true
  create_flow_log_cloudwatch_iam_role       = true
  flow_log_cloudwatch_log_group_name_prefix = "/aws/${var.name}-vpc-flow-log/"
  flow_log_cloudwatch_log_group_name_suffix = "vpc_log"

  flow_log_max_aggregation_interval = 60

  tags = var.tags
}