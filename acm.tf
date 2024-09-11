module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "5.0.1"


  domain_name = trimsuffix(local.route53_zoneName, ".")
  zone_id     = local.route53_zoneId

  validation_method = "DNS"

  wait_for_validation = true

  subject_alternative_names = [
    "*.${trimsuffix(local.route53_zoneName, ".")}"
  ]
}

