provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Default"
  }
}

resource "aws_subnet" "db_subnet" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "DBSubnet"
  }
}

resource "aws_subnet" "app_subnet" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "AppSubnet"
  }
}