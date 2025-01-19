terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = var.environement
    }
  }
  profile = "sandbox"
}

module "ec2" {
  source                    = "./modules/ec2"
  iam_instance_profile_name = module.iam.iam_instance_profile_name
}

module "iam" {
  source   = "./modules/iam"
  org-name = var.org-name
  pet_id   = module.random_pet.pet_id
}

module "sg" {
  source  = "./modules/sg"
  sg_name = var.sg_name
}

module "s3" {
  source         = "./modules/s3"
  s3_buckets     = var.s3_buckets
  s3_base_object = var.s3_base_object
  pet_id         = module.random_pet.pet_id
}

module "random_pet" {
  source = "./modules/random"
}
