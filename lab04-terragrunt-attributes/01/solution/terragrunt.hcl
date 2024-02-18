terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws//?version=5.1.1"
}

inputs = {
  name = "KodeKloud-VPC"
  cidr = "10.64.0.0/16"
}
