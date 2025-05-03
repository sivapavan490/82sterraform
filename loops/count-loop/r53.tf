resource "aws_route53_record" "expense" {
    count = length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}" # interpolatiom
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[count.index].private_ip] # it will create the private record of mysql,backend,frontend
      allow_overwrite = true
}

resource "aws_route53_record" "frontend" {
    
  zone_id = var.zone_id
  name    = "${var.domain_name}" 
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[2].public_ip] # it will create the public record of frontend
  allow_overwrite = true
}