locals {
  aws_account_id = "270382647185"
  aws_region     = "eu-west-1"
  project        = "kodekloud-demo"
}

# ----------------------------------------------------------------------------------------------------------------
# GENERATED PROVIDER BLOCK
# ----------------------------------------------------------------------------------------------------------------
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region  = "${local.aws_region}"
  assume_role {
    role_arn = "arn:aws:iam::${local.aws_account_id}:role/doer-role"
  }
  # Only these AWS Account IDs may be operated on by this template
  allowed_account_ids = ["${local.aws_account_id}"]
}
EOF
}

# Use an override file to lock the provider version, regardless of if required_providers is defined in the modules.
generate "provider_version" {
  path      = "provider_version_override.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
EOF
}
