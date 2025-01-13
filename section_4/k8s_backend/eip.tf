provider "aws" {
  region = "us-west-2"
}

resource "aws_eip" "lb" {
  domain = "vpc"
}
