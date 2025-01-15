# Simple, managed policy w/ policy documented encoded to JSON
resource "aws_iam_policy" "managed_policy" {
  name = "terraform-managed-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# Simple, user inline policy w/ policy documented encoded to JSON
resource "aws_iam_user_policy" "user_inline_policy" {
  name = "terraform-inline-policy"
  user = "terraform"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# Simple, managed policy w/ policy documented defined in JSON and referenced via a heredoc string
resource "aws_iam_policy" "json_managed_policy" {
  name = "test-iam-policy"

  policy = <<-EOT
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "ec2:Describe*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOT
}

# Simple, managed policy w/ policy documented defined in a file and referenced via the file function
resource "aws_iam_policy" "file_managed_policy" {
  name   = "file-based-policy"
  policy = file("./ec2-describe.json")
}
