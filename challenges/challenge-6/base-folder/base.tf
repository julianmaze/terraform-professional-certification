terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "sandbox"
}

data "aws_caller_identity" "current" {}

resource "aws_iam_user" "iam_user" {
  name = "kplabs-iam-user"
}

resource "aws_iam_user" "ec2_user" {
  name = "kplabs-ec2-user"
}

resource "aws_iam_user" "default_user" {
  name = "default-profile-user"
}

resource "aws_iam_access_key" "iam_user_key" {
  user = aws_iam_user.iam_user.name
}

resource "aws_iam_access_key" "ec2_user" {
  user = aws_iam_user.ec2_user.name
}

resource "aws_iam_access_key" "default_user" {
  user = aws_iam_user.default_user.name
}

resource "aws_iam_policy" "assume_role_policy" {
  name        = "AssumeRolePolicy"
  description = "Allows sts:AssumeRole for all IAM roles"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "sts:AssumeRole",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "iam_user_attach" {
  name       = "test-attachment"
  users      = [aws_iam_user.iam_user.name]
  policy_arn = aws_iam_policy.assume_role_policy.arn
}

resource "aws_iam_policy_attachment" "ec2_user_attach" {
  name       = "test-attachment"
  users      = [aws_iam_user.ec2_user.name]
  policy_arn = aws_iam_policy.assume_role_policy.arn
}

resource "aws_iam_policy_attachment" "default_user_attach" {
  name       = "test-attachment"
  users      = [aws_iam_user.default_user.name]
  policy_arn = aws_iam_policy.assume_role_policy.arn
}

resource "aws_iam_policy_attachment" "ro_attach" {
  name       = "ro-attachment"
  users      = [aws_iam_user.default_user.name]
  policy_arn = aws_iam_policy.assume_role_policy.arn
}


resource "aws_iam_role" "ec2_full_access" {
  name = "EC2FullAccess"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/kplabs-ec2-user"
      }
      Action = "sts:AssumeRole"
    }]
  })
}


resource "aws_iam_role" "iam_full_access" {
  name = "IAMFullAccess"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/kplabs-iam-user"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ec2" {
  role       = aws_iam_role.ec2_full_access.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "iam" {
  role       = aws_iam_role.iam_full_access.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_role" "read_only_role" {
  name = "ReadOnlyRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/default-profile-user" # Allow all entities in the account
        },
      },
    ],
  })
}

resource "aws_iam_policy" "read_only_policy" {
  name        = "ReadOnlyPolicy"
  description = "Policy for read-only access to all AWS services"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "s3:ListAllMyBuckets",
        Effect   = "Allow",
        Resource = "*",
      },
      {
        Action = [
          "cloudwatch:Describe*",
          "cloudwatch:Get*",
          "cloudwatch:List*",
          "ec2:Describe*",
          "iam:Get*",
          "iam:List*",
          "rds:Describe*",
          "s3:Get*",
          "s3:List*",
          "lambda:Get*",
          "lambda:List*",
          "sts:GetCallerIdentity"
        ],
        Effect   = "Allow",
        Resource = "*",
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "read_only_role_policy_attachment" {
  role       = aws_iam_role.read_only_role.name
  policy_arn = aws_iam_policy.read_only_policy.arn
}


resource "local_file" "creds_file" {
  filename = "default-creds.txt"
  content  = <<EOF
[default]
aws_access_key_id = ${aws_iam_access_key.default_user.id}
aws_secret_access_key = ${aws_iam_access_key.default_user.secret}
EOF
}

output "ec2_fullaccess_role" {
  value = aws_iam_role.ec2_full_access.arn
}

output "iam_fullaccess_role" {
  value = aws_iam_role.iam_full_access.arn
}

output "read_only_role_arn" {
  value = aws_iam_role.read_only_role.arn
}

