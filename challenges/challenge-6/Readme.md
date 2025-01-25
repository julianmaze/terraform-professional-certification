# Score
Time: 18:57

This one was easy

## Challenge 6

This challenge focuses on implementing a multi-provider configuration and focusses on your understanding of AWS Provider

### Base Task

The following important resource related code is configured  in the `base-folder`:

| Resource Code | Description | 
| :---        |    :----:   | 
| `EC2FullAccess` IAM Role  | Provides Full Access to EC2 service.      | 
| `IAMFullAccess` IAM Role | Provides Full Access to IAM service.   | 
| `ReadOnlyRole` IAM Role | Provides Read Only Access to Necessary Services.   | 
| `default-profile-user` | Ability to Assume `ReadOnlyRole` IAM Role in AWS Account    
| `kplabs-ec2-user` | Ability to Assume `EC2FullAccess` IAM Role in AWS Account    
| `kplabs-iam-user` | Ability to Assume `IAMFullAccess` IAM Role in AWS Account    

Navigate to the base-folder and run  `terraform apply -auto-approve` to create necessary resource before proceeding to Task 1.


### Tasks:

### 1. Build the AWS Config File

Create 3 profiles in the `./aws/config` file with following names
```sh
readonly-access
iam-access
ec2-access
```

All the three profiles should have following configuration
```sh
region=us-east-1
output=text
```

* `iam-access` profile should assume `IAMFullAccess` IAM role created from the base folder.
* `ec2-access` profile should assume `EC2FullAccess` IAM role created from the base folder.
* `readonly-access` profile should assume `ReadOnlyRole` IAM role created from the base folder.

### 2. Build the AWS Credentials File

The `./aws/credentials` file MUST have credentials associated with only 2 profiles in following format:

```sh
[iam-access]
aws_access_key_id=ACCESS-KEY-HERE
aws_secret_access_key=SECRET-KEY-HERE

[ec2-access]
aws_access_key_id=ACCESS-KEY-HERE
aws_secret_access_key=SECRET-KEY-HERE
```

The Access/Secret key for `[iam-access]` profile should be fetched from IAM user named `kplabs-iam-user` created from the base  folder.

The Access/Secret key for `[ec2-access]` profile should be fetched from IAM user named `kplabs-ec2-user` created from the base  folder.


### 3. Add Source Profile

The `readonly-access` profile should be configured to use credentials associated with `default` profile to assume the necessary role. Add necessary parameter to this profile to achieve this.

You cannot add `[default]` profile in `./aws/config` or `./aws/credentials` file of challenge-6 folder.

The `default` profile credentials are present in a file named `default-creds.txt` in `base-folder`.


### 4. Modify `challenge-6.tf` file

* `aws_iam_role` resource type must use the `[iam-access]` profile.

* `aws_security_group` resource type must use the `[ec2-access]` profile.

* `aws_caller_identity` data source should use of information mentioned in `readonly-access` profile to make request to AWS.

> [!TIP]
> For `readonly-access` profile related configuration, you can fetch all necessary information from `.aws/config` file and `default-creds.txt` and add it in the `provider` block instead of referencing these files.
> 
### 5. Apply Changes

Run `terraform apply -auto-approve` to ensure all resources are created successfully.

### 6. Remove Deprecation Related Warnings

Remove any deprecated warnings that you might see as part of code / output. 


### 7.  Destroy Infrastructure

Delete all the infrastructure created as part of this Lab.



