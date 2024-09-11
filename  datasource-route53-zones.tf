data "aws_route53_zone" "myDomain" {
  name         = local.domain
  private_zone = false
}

output "my_domain_zone_id" {
  description = "The Hosted Zone id of the desired domain"
  value       = data.aws_route53_zone.myDomain.zone_id
}