provider "aws" {
  region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
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

resource "aws_eip" "bastion_ip" {
  vpc = true
  instance = aws_instance.bastion.id
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

  }
}

resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = "Project VPC IG"
  }
}

#resource "aws_internet_gateway_attachment" "example" {
#  internet_gateway_id = aws_internet_gateway.example.id
#  vpc_id              = aws_vpc.example.id
#}

resource "aws_instance" "bastion" {
  ami           = var.ami_name
  instance_type = "t2.micro"
  key_name      = aws_key_pair.keypair.key_name
  associate_public_ip_address = true
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.public_ec2.id]
  tags = {
    Name = var.instance1_name
  }
}
resource "aws_key_pair" "keypair" {
  key_name   = "public"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC3NsRVLjZUxO+t6m8F1ETWqrC4iBDQTOcf7JdLnsemT bibinjoy2255@gmail.com"
}

resource "aws_key_pair" "private" {
  key_name   = "private"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC3NsRVLjZUxO+t6m8F1ETWqrC4iBDQTOcf7JdLnsemT bibinjoy2255@gmail.com"
}

resource "aws_instance" "private" {
  ami           = var.ami_name
  instance_type = "t2.micro"
  key_name      = aws_key_pair.private.key_name
  subnet_id     = aws_subnet.private_1.id
  vpc_security_group_ids = [aws_security_group.private_ec2.id]
  tags = {
    Name = var.instance2_name
  }
}

