terraform {
    required_version = ">=0.12"
}

resource "aws_instance" "webserver" {
    ami = var.ami  //ami value taken for AWS Website EC2 -> Launch Instance -> Choose Location -> Copy required ami
    instance_type = var.instance_type  //Free tier compatible
}