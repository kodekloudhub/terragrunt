# QUESTION

Create a `terraform` block and source the AWS VPC module version 5.5.1

# SOLUTION

The terraform block should be the following:

```bash
terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws//?version=5.5.1"
}
```
