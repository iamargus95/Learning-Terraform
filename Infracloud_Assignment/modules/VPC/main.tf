terraform {
    required_version = ">=0.12"
}


resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "private" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${element(var.private_cidr_block, count.index)}"
  
}

resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = var.public_cidr_block
}

resource "aws_internet_gateway" "gandalf" {
  vpc_id = "${aws_vpc.main.id}"

}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"
  route {

  }
}

resource "aws_route_table_association" "public" {
  
}

resource "aws_eip" "nat_private" {
  
}

resource "aws_nat_gateway" "nat_gandalf" {
  
}

resource "aws_route_table" "private" {
  
}

resource "aws_route_table_association" "private" {
  
}

resource "aws_security_group" "ssh" {
  
}

resource "aws_security_group" "name" {
  
}
