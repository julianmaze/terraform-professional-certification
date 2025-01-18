output "s3_buckets" {
  value = [for x in aws_s3_bucket.example : x.id] // Or aws_s3_bucket.example[*].id
}

output "user_names" {
  value = [for x in aws_iam_user.lb : x.id] // Or aws_iam_user.lb[*].id
}

# output "sg_id" {
#   value = aws_security_group.example.id
# }

# output "sg_rule_id" {
#   value = aws_vpc_security_group_ingress_rule.example.id
# }
