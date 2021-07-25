

provider "aws" {
  region     = var.region
}

resource "aws_instance" "web" {
  instance_type          = var.instance_type
  ami                    = var.ami_id
  vpc_security_group_ids = [var.sgp[0]]
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  user_data              = <<-EOF
              #!/bin/bash
              yum install epel-release -y
              yum install vim -y
              yum install curl -y
              yum install wget -y
              yum install httpd -y
              echo "Welcome to my blog" > /var/www/html/index.html
              yum update -y
              service httpd start
              curl localhost
              EOF
  tags = {
    Name        = var.name
    Product     = var.product
    Tower       = var.tower
    Environment = var.environment
    Mail        = var.mail
    Owner       = var.owner
    Place       = var.place
    Country     = var.country
    Divsion     = var.division
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "ap-south-1a"
  size              = 10
}

resource "aws_volume_attachment" "example" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}
