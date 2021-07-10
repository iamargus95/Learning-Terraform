variable "cidr_block" {
    type = string
    description = "10.0.0.0/16 allows you to use the IP address that start with “10.0.X.X”."
    default = "10.0.0.0/16"
}

variable "instance_tenancy" {
    type = string
    description = "A tenancy option for instances launched into the VPC. Default is default, which makes your instances shared on the host. Using either of the other options (dedicated or host) costs at least $2/hr."
    default = "default"
}

variable "vpc_name" {
    type = string
    description = "Name of the VPC"
    default = "VPC_1"
}

variable "private_cidr_block" {
    type = list(string)
    description = "IP of the 3 private subnets."
    default = [ "10.0.1.0/32", "10.0.2.0/32", "10.0.3.0/32" ]
}

variable "public_cidr_block" {
    type = list(string)
    description = "IP of the 3 Public Subnets."
    default = [ "10.0.4.0/32", "10.0.5.0/32", "10.0.6.0/32" ]
}
