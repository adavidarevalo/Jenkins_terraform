locals {
  name   = "${var.app_name}-${var.bussiness_division}-${var.environment}"
  region = var.aws_region
  owners = var.bussiness_division

  azs    = slice(data.aws_availability_zones.available.names, 0, 3)
  domain = var.domain

  hostBastion_key_pair_path = "${path.module}/${var.hostBastion_key_pair_name}.pem"

  route53_zoneId   = data.aws_route53_zone.myDomain.zone_id
  route53_zoneName = data.aws_route53_zone.myDomain.name

  ami_id = data.aws_ami.ec2_ubuntu_ami.id


  tags = {
    owners      = "${var.bussiness_division}-${var.environment}"
    environment = var.environment
  }
}