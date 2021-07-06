terraform {
  required_providers{
      aws={
          source="hashicorp/aws"
      }
  }
}

provider "aws" {
    profile = "default"
    region = "us-east-2"
}

module "webserve" {
    source = "../modules/webserver"
    ami = "ami-00399ec92321828f5"
}