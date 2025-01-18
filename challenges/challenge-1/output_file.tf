resource "local_file" "s3" {
  content  = join("\n", [for x in aws_s3_bucket.example : x.id])
  filename = "${path.module}/s3.txt"
}
resource "local_file" "iam-users" {
  content  = join("\n", [for x in aws_iam_user.lb : x.id])
  filename = "${path.module}/iam-users.txt"
}
# resource "local_file" "sg-combined" {
#   content  = join("\n", [aws_security_group.example.id, aws_vpc_security_group_ingress_rule.example.id])
#   filename = "${path.module}/sg-combined.txt"
# }

