terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }

  backend "kubernetes" {
    secret_suffix = "state"
    config_path   = "~/.kube/config"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "sandbox"
}

module "vpc" {
  source = "../../modules/vpc"
}

# import {
#   to = module.vpc.aws_subnet.random["subnet1"]
#   id = "subnet-090dadb27dc7f1fee"
# }
# import {
#   to = module.vpc.aws_subnet.random["subnet2"]
#   id = "subnet-05bb06fc441882133"
# }
# import {
#   to = module.vpc.aws_vpc.random
#   id = "vpc-066aad8b76537e0f4"
# }
# import {
#   to = module.vpc.aws_vpc.main
#   id = "vpc-025f0b150c9ecc342"
# }
# import {
#   to = module.vpc.aws_subnet.challenge_5["subnet1"]
#   id = "subnet-00debda42ffe736e2"
# }
# import {
#   to = module.vpc.aws_subnet.challenge_5["subnet2"]
#   id = "subnet-024c394a305e5a783"
# }
