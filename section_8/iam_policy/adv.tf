data "aws_iam_policy_document" "example" {

  statement {
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }

  source_policy_documents = [file("./ec2-describe.json")]
}


resource "aws_iam_policy" "policy_custom" {
  name = "tf-data-policy"

  policy = data.aws_iam_policy_document.example.json
}
