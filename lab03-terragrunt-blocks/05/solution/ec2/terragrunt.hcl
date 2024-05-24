terraform {
  source = "tfr:///terraform-aws-modules/ec2-instance/aws//?version=5.6.1"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

inputs = {
  name      = include.root.locals.project
  subnet_id = dependency.vpc.outputs.public_subnets[0]
}
