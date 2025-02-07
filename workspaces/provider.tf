terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }

    backend "s3" {
      bucket = "jaydevops-bucket"
      key = "workspace-demo" # you should have uniqe keys with the bucket, same key should not be used in other repos or tf project
      region = "us-east-1"
      dynamodb_table = "jaydevops-table"
    }
}

provider "aws" {
  #Configuration options
  region = "us-east-1"
}