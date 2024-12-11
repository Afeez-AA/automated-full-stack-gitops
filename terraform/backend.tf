# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 4.0"
#     }

#   }

#   # Initial local backend before migration
#   backend "local" {
#     path = "terraform.tfstate"
#   }
# }

# # Prepare for remote backend configuration
# locals {
#   # Combine backend configuration using variables
#   backend_config = {
#     bucket         = aws_s3_bucket.terraform_state.id
#     key            = var.backend_state_key
#     region         = var.aws_region
#     dynamodb_table = aws_dynamodb_table.terraform_locks.name
#     encrypt        = var.backend_encrypt
#   }

#   # Generate backend configuration command
#   backend_config_command = join(" ", [
#     "-backend-config=\"bucket=${local.backend_config.bucket}\"",
#     "-backend-config=\"key=${local.backend_config.key}\"",
#     "-backend-config=\"region=${local.backend_config.region}\"",
#     "-backend-config=\"dynamodb_table=${local.backend_config.dynamodb_table}\"",
#     "-backend-config=\"encrypt=${local.backend_config.encrypt}\""
#   ])
# }

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