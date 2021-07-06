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

resource "aws_instance" "ubuntu_LTS" {
    ami = "ami-00399ec92321828f5"   //ami value taken for AWS Website EC2 -> Launch Instance -> Choose Location -> Copy required ami
    instance_type = "t2.micro"  //Free tier compatible
}