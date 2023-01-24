provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = var.private_subnet_1_cidr_block
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = false
  tags = {
    Name = var.private1_subnet_name
  }
}

resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = var.private_subnet_2_cidr_block
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = false
  tags = {
    Name = var.private2_subnet_name
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = "${var.aws_region}c"
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_security_group" "public_ec2" {
  name        = "public_ec2"
  description = "Security group for public EC2 instance"
  vpc_id      = aws_vpc.example.id
  tags = {
    Name = var.sg1_name
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "private_ec2" {
  name        = "private_ec2"
  description = "Security group for private EC2 instance"
  vpc_id      = aws_vpc.example.id
  tags = {
    Name = var.sg2_name
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

resource "aws_instance" "public" {
  ami           = "ami-084e8c05825742534"
  instance_type = "t2.micro"
  key_name      = var.public_ec2_key_name
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.public_ec2.id]
  tags = {
    Name = var.instance1_name
  }
}

resource "aws_instance" "private" {
  ami           = "ami-084e8c05825742534"
  instance_type = "t2.micro"
  key_name      = var.private_ec2_key_name
  subnet_id     = aws_subnet.private_1.id
  vpc_security_group_ids = [aws_security_group.private_ec2.id]
  tags = {
    Name = var.instance2_name
  }
}

