# Terraform provider block 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 1.0"
      
    }
  }
}
# aws provider block 
provider "aws" {
  
  region = var.aws_Region
}

variable "aws_Region" {
    description = "specify the region"
    type =  string
    default = "us-east-1"
}