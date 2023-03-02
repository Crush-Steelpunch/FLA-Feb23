/*
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}
*/

provider "aws" {
  region = "eu-west-2"
}


resource "aws_security_group_rule" "leoninstancesecgroupruleSSH" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "sg-00a6a30fd569b26bb"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "leonsinstance" {
  ami                         = var.amiimageid
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = var.mykey
  tags = {
    Name = "LeonInstance"
  }

}
resource "aws_instance" "leonsinstance2" {
  ami                         = var.amiimageid
  instance_type               = "t2.small"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  key_name                    = var.mykey
  tags = {
    Name = "LeonInstance2"
  }

}

output "leoninstance2pubip" {
  value = aws_instance.leonsinstance2.public_ip
}

output "leoninstancepubip" {
  value = aws_instance.leonsinstance.public_ip
}
