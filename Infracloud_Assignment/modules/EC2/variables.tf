variable "ami" {
    type = string
    description = "AMI to use on the Instance"
    default = "ami-00399ec92321828f5"
}

variable "instance_type" {
    type = string
    description = "Instance Type"
    default = "t2.micro"
}

variable "m_public_id" {
    
}

variable "ssh_secgrp_id" {
  
}