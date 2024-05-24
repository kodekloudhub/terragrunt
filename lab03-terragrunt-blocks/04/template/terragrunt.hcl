remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "<AUTOGENERATED>-tf-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

locals {
  project = "KodeKloud-Labs"
}
