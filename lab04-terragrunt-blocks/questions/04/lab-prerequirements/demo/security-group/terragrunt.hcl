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

# ---------------------------------------------------------------------------------------------------------------------
# We override inputs only specifically related to the environment.
# ---------------------------------------------------------------------------------------------------------------------

inputs = {
  name        = "${local.project}-security-group"
  description = "KodeKloud Demo Security Group"
  vpc_id      =

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
