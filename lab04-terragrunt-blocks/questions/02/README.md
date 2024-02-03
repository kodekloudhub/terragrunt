# QUESTION

Set the remote backend to S3. The remote_state block should have the following settings:
 - The config attribute should have:
   - Encryption enabled
   - Bucket name set to "kodekloud-remote-state-<RANDOMIZED_STRING>"
   - The key name set to terragrunt.hcl --- We might need to include the `path_relative_to_include()` because of conflicts
   - The region set to `eu-west-1`
   - The DynamoDB table name set to "kodekloud-remote-locks-<RANDOMIZED_STRING>"
 - The generate attribute should have:
   - the `path` set to `backend.tf`
   - the `if_exists` set to "overwrite_terragrunt"
  
# SOLUTION

The remote_state block should be the following:

```
remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "kodekloud-remote-state-<RANDOMIZED_STRING>"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
```
