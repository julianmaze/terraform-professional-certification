data "aws_iam_policy_document" "example" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "test_role" {
  name               = "terraform-iam-role"
  assume_role_policy = data.aws_iam_policy_document.example.json
}

data "aws_iam_policy" "admin" {
  name = "AdministratorAccess"
}

resource "aws_iam_policy_attachment" "admin" {
  name       = "admin-attachment"
  roles      = [aws_iam_role.test_role.name]
  policy_arn = data.aws_iam_policy.admin.arn
}

provider "aws" {
  region  = "us-west-2"
  profile = "182758033613_AdministratorAccess"
}
