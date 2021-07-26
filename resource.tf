
# This is the file to update resoruce provisioning for an environments

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
              echo "Welcome to my blog will be accessible via internet" > /var/www/html/index.html
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

resource "aws_vpc" "demo" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name        = "demo"
    Tower       = var.tower
    Environment = var.environment
    Mail        = var.mail
    Owner       = var.owner
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "192.168.1.0/24"

  tags = {
    sub_name    = var.subnet_name
    Purpose     = var.purpose
    Tower       = var.tower
    Environment = var.environment
    Mail        = var.mail
    Owner       = var.owner
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "192.168.2.0/24"

  tags = {
    sub_name    = var.pri_subnet_name
    Purpose     = var.pri_purpose
    Tower       = var.tower
    Environment = var.environment
    Mail        = var.mail
    Owner       = var.owner
  }
}

# Security Group creation
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.demo.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.demo.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "allow_ssh"
    Tower       = var.tower
    Environment = var.environment
    Mail        = var.mail
    Owner       = var.owner

  }
}
