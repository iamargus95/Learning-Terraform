output "m_public_id" {
    value = "${aws_subnet.public.*.id}"
}

output "m_private_id" {
    value = "${aws_subnet.private.*.id}"
}

output "ssh_secgrp_id" {
    value = "${aws_security_group.ssh.id}"
}

output "database_secgrp_id" {
    value = "${aws_security_group.data-conn.id}"
}

output "vpc_id" {
    value = "${aws_vpc.main.id}"
}