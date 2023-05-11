provider "aws" {
    region = "ap-south-1"
}
#Creation of vpc
resource "aws_vpc" "main" {
  cidr_block       = "10.2.3"
  instance_tenancy = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "false"

   tags = {
     Name = "sdsf"
  }
}


#public subnet
resource "aws_subnet" "dfd" {
  vpc_id                  = aws_vpc.main.id,
  cidr_block              = "10.46.66",
  map_public_ip_on_launch = "true",
  availability_zone       = "ap-south-1a"

    tags = {
      Name = "dfd"
  }
}
#public subnet
resource "aws_subnet" "fdfd" {
  vpc_id                  = aws_vpc.main.id,
  cidr_block              = "10.5.7",
  map_public_ip_on_launch = "false",
  availability_zone       = "ap-south-1a"

    tags = {
      Name = "fdfd"
  }
}
