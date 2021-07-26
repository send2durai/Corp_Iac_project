## Output section for the services, we spin up in Amazon Web Services

output "web_public_ip" {
  value = aws_instance.web.public_ip
}

output "web_private_ip" {
  value = aws_instance.web.private_ip
}

output "web_id" {
  value = aws_instance.web.id
}

output "demo_vpc" {
  value = aws_vpc.demo.id
}

output "pubsubnet" {
  value = aws_subnet.public-subnet.cidr_block
}

output "privsubnet" {
  value = aws_subnet.private-subnet.cidr_block
}

output "securitygroup" {
  value = aws_security_group.allow_ssh.id
}
