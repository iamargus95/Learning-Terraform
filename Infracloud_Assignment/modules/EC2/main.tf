resource "aws_instance" "webserver" {
    ami = var.ami  //ami value taken for AWS Website EC2 -> Launch Instance -> Choose Location -> Copy required ami
    instance_type = var.instance_type  //Free tier compatible
    count = "${length(var.m_public_id)}"
    subnet_id = "${element(var.m_public_id, count.index)}"
    associate_public_ip_address = true
    vpc_security_group_ids = "${[var.ssh_secgrp_id]}"
}

resource "aws_key_pair" "deploy" {
  key_name = "argus"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDnEpPfWGVy/mcdgU0OXT6MYoq8xt4yf/gXsDbkPCYDvUaMtnPQRfY+bHu2jeZtjoG8HLZEaE2W2VCT6Xxl/0VLEH7Xv9HbicTgIlPtAYSpW/l5WQks/MCarOogo1M4MC0bhhpD5XdCvRq8SrMTAY8uKg7Kv61/6goqfkGp3UIhdz1L9lqXh1Syw8tEiN6A3FERMnkYJfewAZbSo2ve97I5BbikjR9jurkhsreifjubdBhzPpK18CmeRlFrRHFjBIXZfKVtmCkdh4Dv1eMGMmS71pwLo4oth3PnWtoBbMD6Tpb9Xo7hdW+qxxX+jX8UfhIKxn/Hi9NMn/NEt5fY7Da5"
}