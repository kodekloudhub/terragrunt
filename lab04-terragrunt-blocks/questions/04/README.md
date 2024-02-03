# QUESTION

# SOLUTION

The dependency block should be the following:

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


# note

should I build a separate code base for this not to overwhelm the user?
