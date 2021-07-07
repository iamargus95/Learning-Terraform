variable "image" {
    type = string
    description = "Boot disk Image ID to be used to crate the server"
    default = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "network" {
    type = string
    description = "Type of network"
    default = "default"
}

variable "name" {
    type = string
    description = "Name of Resource"
    default = "my-ubuntults"
}

variable "machine_type" {
    type = string
    description = "Type of server configuration you want to use i.e f1-micro/medium etc."
    default = "f1-micro"
}