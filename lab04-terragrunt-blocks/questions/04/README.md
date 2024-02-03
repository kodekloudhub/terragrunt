# QUESTION

# SOLUTION

The dependency block within the `security-group/terragrunt.hcl` should be the following:

dependency "vpc" {
  config_path = "${find_in_parent_folders("networking")}/vpc"
}

The `vpc_id` parameter of the `security-group/terragrunt.hcl` should reference the vpc dependency:

`vpc_id = dependencies.outputs.vpc_id`

# note

should I build a separate code base for this not to overwhelm the user?
