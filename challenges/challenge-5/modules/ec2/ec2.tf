resource "aws_instance" "ec2" {
  for_each      = var.subnet_ids
  subnet_id     = each.key
  instance_type = "t3.micro"
  ami           = "ami-0df8c184d5f6ae949"
}

variable "subnet_ids" {
  type = set(string)
}
