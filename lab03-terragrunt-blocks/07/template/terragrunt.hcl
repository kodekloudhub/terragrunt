remote_state {
  backend = "s3-bucket"
  config = {
    encrypt        = yes
    bucket         = "<AUTOGENERATED>-tf-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    environment    = "eu-west-1"
    dynamodb_table = "terraform-locks"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

locals {
  project       = "KodeKloud-Labs"
  ami           = "ami-003c6328b40ce2af6"
  instance_type = "t3.nano"
}

generate "provider" {
  path      = ""
  if_exists = ""
  contents  = <<EOF

EOF
}

generate "provider_version" {
  path      = ""
  if_exists = ""
  contents  = <<EOF

EOF
}
