variable "ami" {
    type = string
    description = "AMI to use on the Instance"
}

variable "instance_type" {
    type = string
    description = "Instance Type"
    default = "t2.micro"
}