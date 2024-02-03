# Terragrunt Labs

This repo contains the source code for labs

The structure is under development and prone to breaking changes until v1 is done.

Each lab contains:
  - `README.md` - Explains the purpose and guide to creating the lab
  - `lab-prerequirements` - contains info about what needs to be set up in a lab prior to user interaction
  - `questions` - contains numbered directories for each question
    - `questions/lab-prerequirements` - Several labs have prerequirements that need to be fulfilled in order to set up the question.

### Question and Technicalities: 
 - Talk about separating the labs into multiple questions/blocks or keeping it in "final form"
 - The [account_id in the locals](lab03-example-vpc-plan-apply/terragrunt.hcl) of some terragrunt.hcl needs to be sourced by the lab somehow.
 - Lots of other fields contain `<RANDOMIZED` where se need to have a random string passed and bound maybe run `envsubst` to replace it dynamically in the code base upon launching the lab question


### TODO

 - Still need to finish lab 04
 - Do complete questions for lab 05
 - finish lab06 configuration
 - Test all labs locally 
