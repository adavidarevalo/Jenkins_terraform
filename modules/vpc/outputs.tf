#VPC
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "vpc_private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "database_subnet_group" {
  value = module.vpc.database_subnet_group
}

output "database_route_table_ids" {
  value = module.vpc.database_route_table_ids
}

output "vgw_id" {
  value = module.vpc.vgw_id
}

output "database_subnets" {
  value = module.vpc.database_subnets
}

output "database_subnets_cidr_blocks" {
  value = module.vpc.database_subnets_cidr_blocks
}