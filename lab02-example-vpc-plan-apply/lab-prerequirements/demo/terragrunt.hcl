terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws//?version=5.5.1"
}

locals {
  vpc_cidr   = "10.64.0.0/16"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

inputs = {
  name = "${include.root.locals.project}-vpc"

  cidr                = local.vpc_cidr
  azs                 = ["${include.root.locals.aws_region}a", "${include.root.locals.aws_region}b"]
  private_subnets     = ["10.64.0.0/24", "10.64.1.0/24"]
  public_subnets      = ["10.64.2.0/24", "10.64.3.0/24"]
}
