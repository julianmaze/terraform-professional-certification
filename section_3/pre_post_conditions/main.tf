variable "instance_type" {
  type    = string
  default = "t2.micro"
}

data "aws_ec2_instance_type" "example" {
  instance_type = var.instance_type
}

output "instance_type" {
  value = data.aws_ec2_instance_type.example.free_tier_eligible
}

resource "aws_instance" "example" {
  instance_type = var.instance_type
  ami           = "ami-066784287e358dad1"

  lifecycle {

    precondition {
      condition     = data.aws_ec2_instance_type.example.free_tier_eligible
      error_message = "Instance Type is not part of free tier"
    }

    postcondition {
      condition     = self.public_dns == ""
      error_message = "Public IPV4 or DNS is mandatory for this server"
    }
  }
}
