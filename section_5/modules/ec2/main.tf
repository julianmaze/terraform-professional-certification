terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "ami" {
  description = "The AMI to use for the EC2 instance"
}

variable "instance_type" {
  description = "The type of instance to launch"
  default     = "t2.micro"
}

resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
}
