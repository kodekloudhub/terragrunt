# This lab consists of two questions:

# QUESTION

The VPC has been configure and applied.
A security group needs to be created and an engineer has already set up the terragrunt configuration for the security group but the dependency to the VPC module has to be created.

Help the previous engineer by creating a dependency for the VPC module and then dynamically fetch the `vpc_id` parameter from the dependency.

# SOLUTION

The dependency block within the `security-group/terragrunt.hcl` should be the following:

dependency "vpc" {
  config_path = "${find_in_parent_folders("networking")}/vpc"
}

The `vpc_id` parameter of the `security-group/terragrunt.hcl` should reference the vpc dependency:

`vpc_id = dependencies.outputs.vpc_id`


# note

should I build a separate code base for this not to overwhelm the user?
