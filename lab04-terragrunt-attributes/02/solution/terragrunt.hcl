terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws//?version=5.8.1"
}

inputs = {
  name = "KodeKloud-VPC"
  cidr = "10.64.0.0/16"
}

download_dir = "../.terragrunt-config"
