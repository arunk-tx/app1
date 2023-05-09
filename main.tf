provider "aws" {
    region = "ap-south-1"
}
#Creation of vpc
resource "aws_vpc" "main" {
  cidr_block       = "10.4"
  instance_tenancy = "dedicated"
  enable_dns_support = "true"
  enable_dns_hostnames = "false"

   tags = {
    Name = "no"
  }
}


#public subnet
resource "aws_subnet" "tag1" {
  vpc_id = aws_vpc.main.id,
  cidr_block = "10.3.6",
  map_public_ip_on_launch = "true",
  availability_zone = "ap-south-1a"

    tags = {
    Name = "tag1"
  }
}
#public subnet
resource "aws_subnet" "tag2" {
  vpc_id = aws_vpc.main.id,
  cidr_block = "10.7.8",
  map_public_ip_on_launch = "false",
  availability_zone = "ap-south-1b"

    tags = {
    Name = "tag2"
  }
}
