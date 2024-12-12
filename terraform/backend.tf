terraform {
  backend "s3" {
    bucket         = "devops-dojo-az01"
    region         = "us-east-1"
    key            = "devops-dojo-az01/terraform.tfstate"
    dynamodb_table = "devops-dojo-az01-lock"
    encrypt        = true
  }

  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}