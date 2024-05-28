terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws//?version=5.8.1"
}

inputs = {
  name = "KodeKloud-VPC"
  cidr = "10.64.0.0/16"
}

download_dir = "../.terragrunt-config"

prevent_destroy = true

skip = true

iam_role = "arn:aws:iam::ACCOUNT_ID:role/KodeKloud-Role"

terraform_binary =
