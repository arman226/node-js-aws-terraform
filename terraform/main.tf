terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0.0"
}
# Configures the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

#Creates an EC2 Instance with the name web_server

resource "aws_instance" "web_server" {
  ami                    = "ami-01f5a0b78d6089704" #Amazon Linux 2 AMI
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id] # <-- ADD THIS LINE
  key_name               = var.key_name

  # User data script for Ubuntu
  user_data = <<-EOF
              #!/bin/bash -ex
              yum update -y
              yum install -y git
              curl -sL https://rpm.nodesource.com/setup_16.x | bash -
              yum install -y nodejs
              git clone https://github.com/arman226/node-js-aws-terraform home/ec2-user/node-js-aws-terraform
              cd home/ec2-user/node-js-aws-terraform
              npm install
            EOF

}

resource "aws_security_group" "web_sg" {
  name = "web_sg"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access from anywhere
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }

}
