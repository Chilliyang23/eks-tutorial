resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc-name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw-name
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.vpc.id

  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet-name
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.rt-name
  }
}

resource "aws_route_table_association" "rt-association" {
  route_table_id = aws_route_table.rt.id
  subnet_id      = aws_subnet.public-subnet.id
}

resource "aws_security_group" "sg" {
  vpc_id      = aws_vpc.vpc.id
  name        = var.sg-name
  description = "Allowing Jenkins, Sonarqube, SSH Access"

  ingress = [for port in [22, 8080, 9000] : {
    from_port        = port
    to_port          = port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    self             = false
    prefix_list_ids  = []
    security_groups  = []
    description      = "Allow port ${port}"
  }]

  egress = [{
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    self             = false
    description      = "Allow all Outbound"
    prefix_list_ids  = []
    security_groups  = []
    ipv6_cidr_blocks = ["::/0"]
  }]

  tags = {
    Name = var.sg-name
  }
}