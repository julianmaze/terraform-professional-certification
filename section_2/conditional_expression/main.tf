variable "environment" {
  default = "production"
}

resource "aws_instance" "myec2" {
  ami           = "ami-00c39f71452c08778"
  instance_type = var.environment == "development" ? "t2.micro" : "m5.large"
}

variable "region" {
  default = "ap-south-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-00c39f71452c08778"
  instance_type = var.environment == "production" && var.region == "us-east-1" ? "m5.large" : "t2.micro"
}
