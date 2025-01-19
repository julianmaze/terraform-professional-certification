moved {
  from = data.aws_ami.this
  to   = module.ec2.data.aws_ami.this
}

moved {
  from = data.aws_iam_policy_document.assume_role
  to   = module.iam.data.aws_iam_policy_document.assume_role
}

moved {
  from = aws_iam_instance_profile.test_profile
  to   = module.iam.aws_iam_instance_profile.test_profile
}

moved {
  from = aws_iam_role.test_role
  to   = module.iam.aws_iam_role.test_role
}

moved {
  from = aws_iam_user.lb[0]
  to   = module.iam.aws_iam_user.lb[0]
}
moved {
  from = aws_iam_user.lb[1]
  to   = module.iam.aws_iam_user.lb[1]
}
moved {
  from = aws_iam_user.lb[2]
  to   = module.iam.aws_iam_user.lb[2]
}

moved {
  from = aws_iam_user_policy.lb_ro[0]
  to   = module.iam.aws_iam_user_policy.lb_ro[0]
}
moved {
  from = aws_iam_user_policy.lb_ro[1]
  to   = module.iam.aws_iam_user_policy.lb_ro[1]
}
moved {
  from = aws_iam_user_policy.lb_ro[2]
  to   = module.iam.aws_iam_user_policy.lb_ro[2]
}

moved {
  from = aws_instance.this
  to   = module.ec2.aws_instance.this
}

moved {
  from = aws_s3_bucket.example["kplabs-1"]
  to   = module.s3.aws_s3_bucket.example["kplabs-1"]
}
moved {
  from = aws_s3_bucket.example["kplabs-2"]
  to   = module.s3.aws_s3_bucket.example["kplabs-2"]
}

moved {
  from = aws_s3_object.object["kplabs-1"]
  to   = module.s3.aws_s3_object.object["kplabs-1"]
}
moved {
  from = aws_s3_object.object["kplabs-2"]
  to   = module.s3.aws_s3_object.object["kplabs-2"]
}

moved {
  from = aws_security_group.example
  to   = module.sg.aws_security_group.example
}

moved {
  from = aws_vpc_security_group_ingress_rule.example
  to   = module.sg.aws_vpc_security_group_ingress_rule.example
}

moved {
  from = random_pet.this
  to   = module.random_pet.random_pet.this
}
