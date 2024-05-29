terraform {
  source = "${find_in_parent_folders("modules")}/ec2"
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

dependency "security_group" {
  config_path = "${get_terragrunt_dir()}/../security-group"

  #mock_outputs = {
  #  vpc_id                      = "vpc-terragrunt-mock"
  #  database_subnet_group_name  = "db-subnet-group-terragrunt-mock"
  #  private_subnets_cidr_blocks = ["private-subnet-1-terragrunt-mock", "private-subnet-2-terragrunt-mock"]
  #  public_subnets              = ["public-subnet-1-terragrunt-mock", "public-subnet-2-terragrunt-mock"]
  #}

  #mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
  #mock_outputs_allowed_terraform_commands = ["validate", "init", "plan", "terragrunt-info", "show"]
}

dependency "key_pair" {
  config_path = "${get_terragrunt_dir()}/../key-pair"

  mock_outputs = {
    key_name                      = "mock-key-name"
  }

  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
}

inputs = {
  name            = "KodeKloud-${include.root.account_vars.locals.account_name}-${include.root.region_vars.locals.aws_region}-${include.root.env_vars.locals.env}-instance"
  ami             = "ami-0508ce435f69fcedb"
  key_name        = dependency.key_pair.outputs.key_name
  subnet_id       = dependency.vpc.outputs.public_subnets[0]
  security_groups = dependency.security_group.outputs.security_group_id
}
