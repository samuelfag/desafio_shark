provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "frontend" {
  vpc_id = aws_vpc.default.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "database" {
  vpc_id = aws_vpc.default.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
}