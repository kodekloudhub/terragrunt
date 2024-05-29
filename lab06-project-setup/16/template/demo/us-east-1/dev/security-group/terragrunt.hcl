terraform {
  source = "tfr:///terraform-aws-modules/security-group/aws//?version=5.1.2"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "vpc" {
  config_path = "${get_terragrunt_dir()}/../vpc"

  mock_outputs = {
    vpc_id                      = "vpc-terragrunt-mock"
    database_subnet_group_name  = "db-subnet-group-terragrunt-mock"
    private_subnets_cidr_blocks = ["private-subnet-1-terragrunt-mock", "private-subnet-2-terragrunt-mock"]
    public_subnets              = ["public-subnet-1-terragrunt-mock", "public-subnet-2-terragrunt-mock"]
  }

  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
  #mock_outputs_allowed_terraform_commands = ["validate", "init", "plan", "terragrunt-info", "show"]
}

inputs = {
  name   = "KodeKloud-${include.root.account_vars.locals.account_name}-${include.root.region_vars.locals.aws_region}-${include.root.env_vars.locals.env}-security-group"
  vpc_id = dependencies.vpc.outputs.vpc_id
}
