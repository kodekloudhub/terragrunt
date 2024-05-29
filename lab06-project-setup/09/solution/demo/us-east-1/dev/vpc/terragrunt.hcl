terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws//?version=5.8.1"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

inputs = {
  name = "${include.root.account_vars.locals.account_name}-${include.root.region_vars.locals.aws_region}-${include.root.env_vars.locals.env}-vpc"

  cidr                = "10.64.0.0/16"
  azs                 = ["${include.root.locals.region_vars.locals.region}a", "${include.root.locals.aws_region}b"]
  private_subnets     = ["10.64.0.0/24", "10.64.1.0/24"]
  public_subnets      = ["10.64.2.0/24", "10.64.3.0/24"]
}
