terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws//?version=5.5.1"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

locals {
  aws_region = "eu-west-1"
  project    = "kodekloud-demo"
  vpc_cidr   = "10.64.0.0/16"
}

inputs = {
  name = "${local.project}-vpc"

  cidr                = local.vpc_cidr
  azs                 = ["${local.aws_region}a", "${local.aws_region}b"]
  private_subnets     = ["10.64.0.0/24", "10.64.1.0/24"]
  public_subnets      = ["10.64.2.0/24", "10.64.3.0/24"]
}
