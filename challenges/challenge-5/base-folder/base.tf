terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

provider "aws" {
 region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block           = "10.77.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "challenge-5-vpc"
  }
}

resource "aws_subnet" "challenge_5" {
  for_each = {
    subnet1 = { cidr = "10.77.1.0/24", az = "us-east-1a" }
    subnet2 = { cidr = "10.77.2.0/24", az = "us-east-1b" }
  }

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "subnet-${each.key}"
  }
}

resource "aws_vpc" "random" {
  cidr_block           = "10.66.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "random-vpc"
  }
}

resource "aws_subnet" "random" {
  for_each = {
    subnet1 = { cidr = "10.66.1.0/24", az = "us-east-1a" }
    subnet2 = { cidr = "10.66.2.0/24", az = "us-east-1b" }
  }

  vpc_id            = aws_vpc.random.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "subnet-${each.key}"
  }
}
