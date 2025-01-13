# Set
variable "user_names" {
  type    = set(string)
  default = ["alice", "bob", "john", "james"]
}

resource "aws_iam_user" "this" {
  for_each = var.user_names
  name     = each.value
}

# Map
variable "my-map" {
  default = {
    key  = "value"
    key1 = "value1"
  }
}

resource "aws_instance" "web" {
  for_each      = var.my-map
  ami           = each.value
  instance_type = "t3.micro"

  tags = {
    Name = each.key
  }
}
