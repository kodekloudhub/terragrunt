terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws//?version=5.1.1"
}

inputs = {
  name = ""
  cidr = ""
}
