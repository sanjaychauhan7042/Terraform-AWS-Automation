output "loadbalancerdns" {
  value = aws_lb.main.dns_name
}

output "instance1_public_ip" {
  value = aws_instance.main.public_ip
}

output "instance2_public_ip" {
  value = aws_instance.main1.public_ip
}