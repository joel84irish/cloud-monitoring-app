terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "tm-tool"
    key     = "tm-tool/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
    # dynamodb_table = "your-terraform-lock-table"
  }
}

provider "aws" {
  region = var.aws_region

  # If you need to assume a role
  # assume_role {
  #   role_arn     = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
  #   session_name = "TerraformSession"
  # }

  default_tags {
    tags = {
      Environment = "sandbox"
      Owner       = "mo"
      Project     = "tm"
    }
  }
}
