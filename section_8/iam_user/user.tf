resource "aws_iam_user" "terraform-user" {
  name = "terraform-user"
}

resource "aws_iam_user_login_profile" "terraform-user" {
  user                    = aws_iam_user.terraform-user.name
  password_reset_required = true # Recommended to set to true
}

resource "aws_iam_access_key" "terraform-user" {
  user = aws_iam_user.terraform-user.name
}
