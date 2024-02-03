terraform {
  source = "tfr:///terraform-aws-modules/security-group/aws//?version=5.1.0"
}

# ---------------------------------------------------------------------------------------------------------------------
# Locals are named constants that are reusable within the configuration.
# ---------------------------------------------------------------------------------------------------------------------
locals {

}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

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


# ---------------------------------------------------------------------------------------------------------------------
# We override inputs only specifically related to the environment.
# ---------------------------------------------------------------------------------------------------------------------

inputs = {
  name        = "${include.root.locals.project}-${include.root.locals.account_name}-ec2-demo"
  description = "EC2 Demo Security Group"
  vpc_id      = dependency.vpc.outputs.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      rule        = "http-80-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  # egress
  egress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
