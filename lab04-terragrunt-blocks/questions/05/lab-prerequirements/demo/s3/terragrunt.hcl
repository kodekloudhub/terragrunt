terraform {
  source = "tfr:///terraform-aws-modules/s3/aws//?version=4.1.0"
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

dependencies {
  paths = ["../networking/vpc"]
}

# ---------------------------------------------------------------------------------------------------------------------
# We override inputs only specifically related to the environment.
# ---------------------------------------------------------------------------------------------------------------------

inputs = {
  bucket = "${include.root.locals.project}-<RANDOMIZED>-bucket"
}
