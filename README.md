# VPC and EC2 Deployment
This Terraform configuration creates a VPC with a CIDR block of `10.0.0.0/16` and two private subnets with CIDR blocks of `10.0.1.0/24` and `10.0.2.0/24`, as well as a public subnet with a CIDR block of `10.0.0.0/24`. It also creates a public EC2 instance in the public subnet with a key pair named `"xxpublic"` and a private EC2 instance in one of the private subnets with a key pair named `"xxprivate"`.

# Usage
1. Install Terraform on your local machine.
2. Clone this repository.
3. Create a file named terraform.tfvars and insert your AWS credentials.
```bash
Run
  terraform init
  terraform plan
  terraform apply
```
Once the infrastructure is created, you can use terraform show to see the outputs.
To delete the infrastructure,
```bash
Run
  terraform destroy
```

#Inputs
The following variables can be passed in to configure the infrastructure:

* `aws_region`: The AWS region to deploy the infrastructure in. 
* `vpc_cidr_block`: The CIDR block for the VPC.
* `private_subnet_1_cidr_block`: The CIDR block for the first private subnet. 
* `private_subnet_2_cidr_block`: The CIDR block for the second private subnet. 
* `public_subnet_cidr_block`: The CIDR block for the public subnet. 
* `public_ec2_key_name`: The key pair name for the public EC2 instance. 
* `private_ec2_key_name`: The key pair name for the private EC2 instance. 

# Outputs
The following outputs are available:

* `vpc_id`: The ID of the VPC.
* `private_subnet_1_id`: The ID of the first private subnet. 
* `private_subnet_2_id`: The ID of the second private subnet. 
* `public_subnet_id`: The ID of the public subnet. 
* `public_ec2_id`: The ID of the public EC2 instance. 
* `private_ec2_id`: The ID of the private EC2 instance.






