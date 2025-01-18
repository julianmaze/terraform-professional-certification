
## Challenge 8

This challenge is designed to help you practice Terraform concepts such as data sources, for expressions, output values, local values.

### Task 1 - Create Base Resources

1. Navigate to the `base-folder`.
2. Run the following command to create the initial resources:

`terraform apply -auto-approve`

As part of this base task, following 3 subnets are created in `central-vpc`

| Subnets |  VPC | 
| :---        |    :----:   | 
| `app-subnet`               | central-vpc      | 
| `database-subnet`            | central-vpc      | 
| `central-subnet`            | central-vpc      | 

### Task 2 - Define Data Source

* Create a file named `datasource.tf` in the root folder.

* Define a data source to fetch CIDR blocks associated with all the 3 subnets created in base-task. 

* Display the fetched subnet IDs as output values named `subnet_ids` along with the name of subnets. 

### Task 3 - Create Security Group 

Create a security group named `kplabs-sg` in the `central-vpc`


### Task 4 - Create VPC Security Group Ingress Rule

Use the `aws_vpc_security_group_ingress_rule` resource type to create security group rules based on the content of the `sg.csv` file and following conditions.

* Only inbound rules must be created.

* Based on the values defined in `cidr_block` in CSV file, following value should be computed

| cidr_block value |  Computational Output | 
| :---        |    :----:   | 
| `app`               | `app-subnet` CIDR block     | 
| `database`            | `database-subnet` CIDR block  | 
| `monitoring`            | `central-subnet` CIDR block     | 
| `anti-virus`            | `central-subnet` CIDR block     | 


### Task 5 - Output Values

Use output values to output data with below shown format:

```sh
filtered_data = {
  "0" = {
    "cidr_block" = "10.0.1.0/24"
    "from_port" = 80
    "to_port" = 80
  }
  "1" = {
    "cidr_block" = "10.0.2.0/24"
    "from_port" = 3306
    "to_port" = 3306
  }
  "2" = {
    "cidr_block" = "10.0.2.0/24"
    "from_port" = 5432
    "to_port" = 5432
  }
...... more rules will be below in your output.
```

### Task 6 - Destroy the Infrastructure

Destroy all the infrastructure created as part of this challenge.
