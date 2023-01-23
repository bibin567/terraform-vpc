variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  default = "10.0.1.0/24"
}

variable "subnet2_cidr" {
  default = "10.0.2.0/24"
}

variable "vpc_name" {
  default = "MyVpc"
}

variable "subnet1_name" {
  default = "mysubnet1"
}

variable "subnet2_name" {
  default = "mysubnet2"
}
