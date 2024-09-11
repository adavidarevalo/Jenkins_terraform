resource "aws_route53_record" "apps_dns" {
  zone_id = var.route53_zone_id
  name    = "jenkins.${var.domain_name}"
  type    = "A"
  alias {
    name                   = aws_lb.jenkins_alb.dns_name
    zone_id                = aws_lb.jenkins_alb.zone_id
    evaluate_target_health = true
  }
}
