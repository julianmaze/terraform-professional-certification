Time: 1:29:37
Score: 



## Challenge 5

This challenge is designed to help you practice Terraform concepts such as data sources, modularization, remote backends, and resource imports. Follow the tasks sequentially to complete the challenge.

### Task 1 - Create Base Resources

1. Navigate to the `base-folder`.
2. Run the following command to create the initial resources:

`terraform apply -auto-approve`

### Task 2 - Define Data Source

* Create a file named `datasource.tf` inside the `base-folder`.

* Define a data source to fetch the IDs of two subnets named `subnet-subnet1` and `subnet-subnet2` from custom VPC named `challenge-5-vpc`.

* Display the fetched subnet IDs as output values named `subnet_ids`

### Task 3 - Create EC2 instances in Custom Subnets

* Create a new file `ec2.tf` in the base-folder.

* Define only a single `aws_instance` resource block. Use `for_each` iterate over data as necessary to create two EC2 instances

  * One EC2 in `subnet-subnet1` (whose subnet id was fetched in Task 2).
  * Second EC2 in `subnet-subnet2`(whose subnet id was fetched in Task 2).

> [!NOTE]
> You need to reference to subnet_id by querying data source. No hardcoding.

### Task 4 - Create Security Group

* Create a new file `sg.tf` in the base-folder.

* Define a single `aws_security_group` resource block using `for_each` to create two security groups:
   * app-1-sg.
   * app-2-sg.

* Ensure the security groups are created in the `challenge-5-vpc`


### Task 5 - Create  Security Group Rules

Refer to the contents of the `sg.csv` file and create security group rule based on following conditions:

1. Use a single `aws_vpc_security_group_ingress_rule` resource block to create security group inbound rules for `app-1-sg` security group. 

* If `description` in CSV is `app-1`, the rule must be associated with `app-1-sg` security group. Only consider inbound rules, the outbound rules should be ignored.

2. Use a single `aws_vpc_security_group_egress_rule` resource block to create security group egress rules for `app-2-sg` security group.

* If `description` in CSV is `app-2`, the rule must be associated with `app-2-sg` security group. Only consider outbound rules, the inbound rules should be ignored.

> [!IMPORTANT]  
> Use the `for_each` and `for expression` to iterate over the contents of CSV files to fetch necessary data.


### Task 6 - Create Necessary Resources

Run the following command to create the resources defined in previous tasks:

`terraform apply -auto-approve`

### Task 7 - Create Folders Based on Following Structure

Create the following folder structure within the challenge-5 directory:

```sh
challenge-5
├── base-folder
├── infra
│   ├── vpc-infra
│   └── others
└── modules
    ├── vpc
    ├── ec2
    └── sg
```

### Task 8 - Refactor Code

Move the following resource types from the `base-folder` into `vpc` child module.

| Resource Types |  Child Module Folder | 
| :---        |    :----:   | 
| `aws_vpc`               | vpc      | 
| `aws_subnet`            | vpc      | 

   
Move the following resource types from the `base-folder` into `ec2` child module.

| Resource Types |  Child Module Folder | 
| :---        |    :----:   | 
| `aws_instance`  | `ec2`   | 

Move the following resource types from the `base-folder` into `sg` child module.

| Resource Types |  Child Module Folder | 
| :---        |    :----:   | 
| `aws_security_group`  | sg   | 
| `aws_vpc_security_group*` | sg    | 


### Task 9 - Use S3 Backend for VPC-Infra

Manually create S3 bucket in your AWS Account.

In the `infra/vpc-infra` folder:
* Call the `vpc` child module using module sources
* Import existing VPC and subnet resources
* Configure S3 backend where state file is stored in `vpc.tfstate`
* Migrate local state to S3 backend
 

### Task 10 - Import EC2 and SG Infrastructure

In `infra/others` folder:
* Reference to the `ec2` and `sg` child modules using module sources.
* Use `terraform_remote_state` to fetch subnet IDs from `vpc.tfstate`
* Define `terraform_remote_state` in root module only and not child.
* Import existing EC2 and security group resources

> [!TIP]
> Ensure outputs in `vpc.tfstate` contain the subnet_ids of both the subnets

### Task 11 - Destroy the Infrastructure

Destroy all the infrastructure created as part of this challenge.
