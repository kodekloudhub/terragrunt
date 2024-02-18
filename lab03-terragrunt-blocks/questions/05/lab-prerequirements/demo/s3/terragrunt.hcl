terraform {
  source = "tfr:///terraform-aws-modules/s3/aws//?version=4.1.0"
}

locals {

}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

dependencies {
  paths = ["../networking/vpc"]
}

inputs = {
  bucket = "${include.root.locals.project}-<RANDOMIZED>-bucket"
}
