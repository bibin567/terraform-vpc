
provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "mysubnet1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.subnet1_cidr
  availability_zone = "eu-west-2a"
  tags = {
    Name = var.subnet1_name
  }
}

resource "aws_subnet" "mysubnet2" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.subnet2_cidr
  availability_zone = "eu-west-2b"
  tags = {
    Name = var.subnet2_name
  }
}
