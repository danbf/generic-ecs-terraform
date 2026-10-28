variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "cross_account_role_arn" {
  type        = string
  description = "The ARN of the TerraformCrossAccountProvisionerRole in the target customer account"
}

variable "environment" {
  type    = string
  default = "production"
}

variable "customer_name" {
  type    = string
  default = "acme"
}
