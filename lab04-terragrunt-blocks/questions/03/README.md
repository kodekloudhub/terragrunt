# QUESTION

Create a locals block with the following configuration:

  - project set to "kodekloud-demo"
  - aws_region set to "eu-west-1"
  - tags with two key-value pairs:
    - "Project" set to `local.project`
    - "CreatedBy" set to "terragrunt"

# SOLUTION

The locals block should be the following:

```
locals {
  project    = "kodekloud-demo"
  aws_region = "eu-west-1"

  tags = {
    Project   = local.project
    CreatedBy = "terragrunt"
  }
}
```
