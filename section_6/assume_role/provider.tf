/*
❯ aws sts get-caller-identity --profile 182758033613_AdministratorAccess
{
    "UserId": "AROASVDJ2JDGYAGFZTGTZ:julianmaze",
    "Account": "182758033613",
    "Arn": "arn:aws:sts::182758033613:assumed-role/AWSReservedSSO_AdministratorAccess_ff56ec2f419a8b13/julianmaze"
}

❯ aws iam get-role --role-name terraform-cert-reader-role --profile 182758033613_AdministratorAccess
{
    "Role": {
        "Path": "/",
        "RoleName": "terraform-cert-reader-role",
        "RoleId": "AROASVDJ2JDG6RCMAQJXS",
        "Arn": "arn:aws:iam::182758033613:role/terraform-cert-reader-role",
        "CreateDate": "2025-01-13T04:17:50+00:00",
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "AdministratorAccessIAMPermSet",
                    "Effect": "Allow",
                    "Principal": {
                        "AWS": "arn:aws:sts::182758033613:assumed-role/AWSReservedSSO_AdministratorAccess_ff56ec2f419a8b13/julianmaze"
                    },
                    "Action": "sts:AssumeRole"
                }
            ]
        },
        "Description": "Used to practice IAM role assumption via Terraform.",
        "MaxSessionDuration": 3600,
        "RoleLastUsed": {}
    }
}
*/

provider "aws" {
  profile = "182758033613_AdministratorAccess"
  assume_role {
    role_arn     = "arn:aws:iam::182758033613:role/terraform-cert-reader-role"
    session_name = "terraform"
  }
}

resource "aws_security_group" "allow_tls_oregon" {
  name = "demo-firewall"
}
