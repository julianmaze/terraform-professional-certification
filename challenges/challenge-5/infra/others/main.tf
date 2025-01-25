terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

data "terraform_remote_state" "k8s" {
  backend = "kubernetes"

  config = {
    secret_suffix = "state"
    config_path   = "~/.kube/config"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "sandbox"
}

module "ec2" {
  source     = "../../modules/ec2"
  subnet_ids = data.terraform_remote_state.k8s.outputs.subnet_ids
}
module "sg" {
  source = "../../modules/sg"
  vpc_id = data.terraform_remote_state.k8s.outputs.vpc_id
}
