module "ec2" {
  source = "../modules/ec2"
  ami    = "ami-0bb84b8ffd87024d8"
}

provider "aws" {
  region = "us-east-1"
}
