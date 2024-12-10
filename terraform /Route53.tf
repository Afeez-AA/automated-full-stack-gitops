# Fetch the existing Route 53 hosted zone by domain name
data "aws_route53_zone" "domain_zone" {
  name         = var.domain_name
  private_zone = false
}

# A Record for the main domain (e.g., example.com)
resource "aws_route53_record" "main_domain_record" {
  zone_id = data.aws_route53_zone.domain_zone.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 300
  records = [aws_instance.ec2.public_ip]
}

# A Record for a wildcard subdomain (e.g., *.example.com)
resource "aws_route53_record" "wildcard_domain_record" {
  zone_id = data.aws_route53_zone.domain_zone.zone_id
  name    = "*.${var.domain_name}" # This sets the wildcard domain, e.g., *.example.com
  type    = "A"
  ttl     = 300
  records = [aws_instance.ec2.public_ip]
}

