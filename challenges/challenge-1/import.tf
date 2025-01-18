# // Users
# import {
#   to = aws_iam_user.lb[0]
#   id = "precise-dodo-kplabs-0"
# }
# import {
#   to = aws_iam_user.lb[1]
#   id = "precise-dodo-kplabs-1"
# }
# import {
#   to = aws_iam_user.lb[2]
#   id = "precise-dodo-kplabs-2"
# }

# // User policy
# import {
#   to = aws_iam_user_policy.lb_ro[0]
#   id = "precise-dodo-kplabs-0:ec2-describe-policy"
# }
# import {
#   to = aws_iam_user_policy.lb_ro[1]
#   id = "precise-dodo-kplabs-1:ec2-describe-policy"
# }
# import {
#   to = aws_iam_user_policy.lb_ro[2]
#   id = "precise-dodo-kplabs-2:ec2-describe-policy"
# }

# // s3 buckets
# import {
#   for_each = toset(var.s3_buckets)
#   to       = aws_s3_bucket.example[each.key]
#   id       = "precise-dodo-${each.value}"
# }

# // s3 bucket objects
# import {
#   for_each = toset(var.s3_buckets)
#   to       = aws_s3_object.object[each.key]
#   id       = "precise-dodo-${each.value}/${var.s3_base_object}"
# }
