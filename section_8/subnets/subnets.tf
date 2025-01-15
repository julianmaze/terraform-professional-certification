# Outputs a list of subnet Ids under the ids attribute
data "aws_subnets" "this" {
  filter {
    name   = "tag:Name"
    values = ["private_01"]
  }
}

# This data source will return in depth information about a single subnet 
# If multiple subnets are matched, terraform will return an error
data "aws_subnet" "this" {
  filter {
    name   = "tag:Name"
    values = ["private_01"]
  }
}
