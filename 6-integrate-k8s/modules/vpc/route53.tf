resource "aws_route53_zone" "app_route53" {
  name = var.route_name
  vpc {
    vpc_id = module.main-vpc.vpc_id
    vpc_region = var.region    
  }
}

resource "aws_route53_record" "server1-record" {
  zone_id = aws_route53_zone.app_route53.zone_id
  name    = "server1.${var.route_name}"
  type    = "A"
  ttl     = "300"
  records = ["104.236.247.8"]
}

resource "aws_route53_record" "www-record" {
  zone_id = aws_route53_zone.app_route53.zone_id
  name    = "www.${var.route_name}"
  type    = "A"
  ttl     = "300"
  records = ["104.236.247.8"]
}


