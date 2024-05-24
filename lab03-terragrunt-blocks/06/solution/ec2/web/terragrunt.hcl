terraform {
  source = "tfr:///terraform-aws-modules/ec2-instance/aws//?version=5.6.1"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "vpc" {
  config_path = "../vpc"
}

dependencies {
  paths = ["../database"]
}

inputs = {
  name          = include.root.locals.project
  ami           = include.root.locals.ami
  instance_type = include.root.locals.instance_type
  subnet_id     = dependency.vpc.outputs.public_subnets[0]
}
