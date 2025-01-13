terraform {
  # Specific terraform version
  required_version = "1.9.1"
  # Specific provider requirements
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
