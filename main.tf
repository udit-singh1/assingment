provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "web" {
  name        = "Nginx-sg"
  description = "sg for web client"
  dynamic "ingress" {
    for_each = [22, 80, 443]
    iterator = port
    content {
      description = "SG-Nginx"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  tags = {
    Name = "Nginx-sg"
    Type = "Web"
  }
}

resource "aws_instance" "web" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web.id]
  tags                        = var.tags_ec2
  user_data                   = file("/home/aakash/extratasks/buddy/script.sh")
}

resource "aws_ami_from_instance" "web-ami" {
  name               = var.ami_name
  source_instance_id = aws_instance.web.id
}

