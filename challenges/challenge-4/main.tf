terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "sandbox"
}

locals {
  ec2_raw_data = csvdecode(file("${path.module}/ec2.csv"))
  // Only instances in the us-east-1 region
  ec2_east = [for x in local.ec2_raw_data : x if x.Region == "us-east-1"]
  instance_type = {
    micro = "t2.micro"
    nano  = "t3.nano"
  }
}

resource "aws_instance" "ec2" {
  count         = length(local.ec2_east)
  instance_type = lookup(local.instance_type, local.ec2_east[count.index].instance_type)
  ami           = local.ec2_east[count.index].AMI_ID
  tags = {
    Name = local.ec2_east[count.index].Team_Name
  }
}

output "running_ec2" {
  # i: index, v: value
  value = [for i, v in aws_instance.ec2 : {
    firewall_id = v.security_groups
    id          = v.id
    region      = local.ec2_east[i].Region
    subnet      = v.subnet_id
    team        = local.ec2_east[i].Team_Name
    type        = local.ec2_east[i].instance_type
  }]
}
