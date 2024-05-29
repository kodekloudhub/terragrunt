terraform {
  source = "tfr:///terraform-aws-modules/key-pair/aws//?version=2.0.3"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

inputs = {
  key_name = "KodeKloud-${include.root.account_vars.locals.account_name}-${include.root.region_vars.locals.aws_region}-${include.root.env_vars.locals.env}-key-pair"
}
