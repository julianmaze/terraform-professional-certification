data "aws_vpc" "challenge-5-vpc" {
  filter {
    name   = "tag:Name"
    values = ["challenge-5-vpc"]
  }
}

data "aws_subnets" "challenge-5-vpc" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.challenge-5-vpc.id]
  }
}

output "subnet_ids" {
  value = data.aws_subnets.challenge-5-vpc.ids
}
