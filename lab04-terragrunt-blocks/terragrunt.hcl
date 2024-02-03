#######################
##  TERRAFORM BLOCK  ##
#######################

terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws//?version=5.5.1"
}

##########################
##  REMOTE_STATE BLOCK  ##
##########################

remote_state {
  backend = "s3"
  config = {
    encrypt                   = true
    bucket                    = lower("${local.name_prefix}-tf-state")
    key                       = "${path_relative_to_include()}/terraform.tfstate"
    region                    = local.aws_region
    dynamodb_table            = "terraform-locks"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

#####################
##  INCLUDE BLOCK  ##
#####################

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "common" {
  path   = "${dirname(find_in_parent_folders())}/common.hcl"
  expose = true
}

####################
##  LOCALS BLOCK  ##
####################

locals {
  aws_account_id = "270382647185"
  aws_region     = "eu-west-1"
  project        = "kodekloud-demo"
}

########################
##  DEPENDENCY BLOCK  ##
########################

dependency "vpc" {
  config_path = "${find_in_parent_folders("networking")}/vpc"

  mock_outputs = {
    vpc_id                      = "vpc-terragrunt-mock"
    database_subnet_group_name  = "db-subnet-group-terragrunt-mock"
    private_subnets_cidr_blocks = ["private-subnet-1-terragrunt-mock", "private-subnet-2-terragrunt-mock"]
    public_subnets              = ["public-subnet-1-terragrunt-mock", "public-subnet-2-terragrunt-mock"]
  }

  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan", "terragrunt-info", "show"]
}

##########################
##  DEPENDENCIES BLOCK  ##
##########################




######################
##  GENERATE BLOCK  ##
######################

generate "provider" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region  = "${local.aws_region}"
}
EOF
}

generate "provider_version" {
  path      = "versions.tf"
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
