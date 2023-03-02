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

resource "aws_instance" "leonsinstance" {
  ami           = "ami-0aaa5410833273cfe"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "feb23-anster"
  tags = {
    Name = "LeonInstance"
  }

}
