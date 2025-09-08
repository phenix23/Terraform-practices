## Crée un VPC
#resource "aws_vpc" "main" {
#  cidr_block       = "10.0.0.0/16"
#  enable_dns_hostnames = true
#  enable_dns_support = true
#
#  tags = {
#    Name = "VPC-DEV"
#  }
#}
#
## Création d'un subset
#resource "aws_subnet" "public" {
#  vpc_id     = aws_vpc.main.id
#  cidr_block = "10.0.1.0/24"
#  availability_zone = "us-east-1a"
#
#  tags = {
#    Name = "Public-Subnet"
#  }
#}
#
#resource "aws_internet_gateway" "gw" {
#  vpc_id = aws_vpc.main.id
#
#  tags = {
#    Name = "IGW-Principal"
#  }
#}
#
#resource "aws_route_table" "public" {
#  vpc_id = aws_vpc.main.id
#
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.gw.id
#  }
#
#  tags = {
#    Name = "Public-Route-Table"
#  }
#}