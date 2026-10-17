terraform {
  required_version = "~> 1.5"
  #   required_providers {
  #     aws = {
  #       source  = "hashicorp/aws"
  #       version = "~> 5.0"
  #     }
  #   }
}

provider "aws" {
  shared_config_files = ["/home/abdelbari/.aws/config"]
  shared_credentials_files = ["/home/abdelbari/.aws/credentials"]
  region  = "eu-central-1" 
  profile = "eks-user"
}

variable "ami_var" {
  default = "ami-09903cd4fe0670a06"
  type = string
}

variable "sub" {
  default = "subnet-05e86563fb36247ab"
}

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.4.1"
  ami = var.ami_var
  subnet_id = var.sub
  tags = {
    Name = "node"
  } 
}

variable "key_name" {
  default = {
    default = "default name"
    prod = "prod_key"
  }
}