resource "aws_db_subnet_group" "data-subnet" {
  name = "main"
  subnet_ids = "${var.private_id}"
  tags = {
    "Name" = "Database Subnet group"
  }
}

resource "aws_db_instance" "mydata" {
    allocated_storage = 10
    engine = "postgres"
    engine_version = "12.5"
    instance_class = "db.t2.micro"
    name = "mydata"
    username = "hello"
    password = "helloworld"
    db_subnet_group_name = "${aws_db_subnet_group.data-subnet.name}"
    vpc_security_group_ids = ["${var.db_grp_id}"]
    skip_final_snapshot = true
    depends_on = [aws_db_group.data-subnet,]
}