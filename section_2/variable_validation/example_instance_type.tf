resource "aws_instance" "myec2" {
  ami           = "ami-123"
  instance_type = var.instance_type
}

variable "instance_type" {
  type = string

  validation {
    condition     = contains(["t3.micro", "t3.medium", "m5.large"], var.instance_type)
    error_message = "Invalid instance type. Choose from: t3.micro, t3.medium, m5.large"
  }
}
