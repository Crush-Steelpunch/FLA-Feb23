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

# 

variable "amiimageid" {
	default = "ami-0aaa5410833273cfe"
}


variable "mykey" {
	default = "feb23-anster"
}

variable "mysecgroup" {
	default = "sg-00a6a30fd569b26bb"
}
resource "aws_security_group_rule" "leoninstancesecgroupruleSSH" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "sg-00a6a30fd569b26bb"
}

resource "aws_instance" "leonsinstance" {
  ami           = var.amiimageid
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = var.mykey
  tags = {
    Name = "LeonInstance"
  }

}
resource "aws_instance" "leonsinstance2" {
  ami           = var.amiimageid
  instance_type = "t2.small"
  associate_public_ip_address = true
  security_groups = [var.mysecgroup]
  key_name = var.mykey
  tags = {
    Name = "LeonInstance2"
  }

}
