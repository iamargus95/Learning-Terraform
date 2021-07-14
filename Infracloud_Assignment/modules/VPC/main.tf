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
  count = "${length(var.private_cidr_block)}"
  cidr_block = "${element(var.private_cidr_block, count.index)}"
  
}

resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.main.id}"
  count = "${length(var.private_cidr_block)}"
  cidr_block = "${element(var.public_cidr_block, count.index)}"
}

resource "aws_internet_gateway" "gandalf" {
  vpc_id = "${aws_vpc.main.id}"

}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gandalf.id
  }
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat_private" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gandalf" {
  allocation_id = aws_eip.nat_private.id
  subnet_id = element(aws_subnet.public.*.id,0)
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gandalf.id
  }
}

resource "aws_route_table_association" "private" {
  count = length(aws_subnet.private)
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "ssh" {
  name = "ssh-secgrp"
  description = "For EC2 instance"
  vpc_id = aws_vpc.main.id
  ingress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Point 2, For EC2 instance allow port 22"
    from_port = 22
    # ipv6_cidr_blocks = [ "value" ]
    # prefix_list_ids = [ "value" ]
    protocol = "tcp"
    # security_groups = [ "value" ]
    # self = false
    to_port = 22
  } ]
  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Set ports to 0 since all are allowed."
    from_port = 0
    # ipv6_cidr_blocks = [ "value" ]
    # prefix_list_ids = [ "value" ]
    protocol = "-1"
    # security_groups = [ "value" ]
    # self = false
    to_port = 0
  } ]
}

resource "aws_security_group" "database-Connection" {
  name = "db-secgrp"
  description = "Point 2, For RDS inbound port set to 5432"
  vpc_id = aws_vpc.main.id
  ingress = [ {
    # cidr_blocks = [ "value" ]
    # description = "value"
    from_port = 5432
    # ipv6_cidr_blocks = [ "value" ]
    # prefix_list_ids = [ "value" ]
    protocol = "tcp"
    security_groups = [ aws_security_group.ssh.id ]
    # self = false
    to_port = 5432
  } ]
  egress = [ {
    # cidr_blocks = [ "value" ]
    # description = "value"
    from_port = 0
    # ipv6_cidr_blocks = [ "value" ]
    # prefix_list_ids = [ "value" ]
    protocol = "-1"
    # security_groups = [ "value" ]
    # self = false
    to_port = 0
  } ]
}
