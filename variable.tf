variable "aws_region" {
  default = "us-east-1"
}

variable "access_key" {
  default = "xxx"
}

variable "secret_key" {
  default = "xxx"
}

variable "vpc_name" {
  default = "Myvpc"
}

variable "ami_name" {
  default = "ami-0b5eea76982371e91"
}

variable "private1_subnet_name" {
  default = "private-subnet1"
}

variable "private2_subnet_name" {
  default = "private-subnet2"
}

variable "public_subnet_name" {
  default = "public subnet"
}

variable "sg1_name" {
  default = "SG1"
}

variable "sg2_name" {
  default = "SG2"
}

variable "instance1_name" {
  default = "Instance1"
}

variable "instance2_name" {
  default = "Instance2"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "private_subnet_1_cidr_block" {
  default = "10.0.1.0/24"
}

variable "private_subnet_2_cidr_block" {
  default = "10.0.2.0/24"
}

variable "public_subnet_cidr_block" {
  default = "10.0.0.0/24"
}



