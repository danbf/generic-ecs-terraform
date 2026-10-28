terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "your-company-terraform-state-bucket"
    key            = "customers/tenant-acme/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
  }
}

provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn     = var.cross_account_role_arn
    session_name = "TenantTerraformProvisioningSession"
  }
}
