########################
##  INPUTS ATTRIBUTE  ##
########################

inputs = {
  name = "${include.envcommon.locals.project}-vpc"
}

##############################
##  DOWNLOAD_DIR ATTRIBUTE  ##
##############################

download_dir = "my-download-dir"

#################################
##  PREVENT_DESTROY ATTRIBUTE  ##
#################################

prevent_destroy = true

######################
##  SKIP ATTRIBUTE  ##
######################

skip = true

#########################################
##  IAM_ROLE (AND RELATED) ATTRIBUTES  ##
#########################################

iam_role = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"

iam_assume_role_duration = 14400

iam_assume_role_session_name = "ExampleSession"

##################################
##  TERRAFORM_BINARY ATTRIBUTE  ##
##################################

terraform_binary =

##############################################
##  TERRAFORM_VERSION_CONSTRAINT ATTRIBUTE  ##
##############################################

terraform_version_constraint = ">= 1.5"

###############################################
##  TERRAGRUNT_VERSION_CONSTRAINT ATTRIBUTE  ##
###############################################

terragrunt_version_constraint = ">= 0.50"

##################################
##  RETRYABLE_ERRORS ATTRIBUTE  ##
##################################

retryable_errors = [
  "(?s).*Failed to load state.*tcp.*timeout.*",
  "(?s).*Failed to load backend.*TLS handshake timeout.*",
  "(?s).*Creating metric alarm failed.*request to update this alarm is in progress.*",
  "(?s).*Error installing provider.*TLS handshake timeout.*",
  "(?s).*Error configuring the backend.*TLS handshake timeout.*",
  "(?s).*Error installing provider.*tcp.*timeout.*",
  "(?s).*Error installing provider.*tcp.*connection reset by peer.*",
  "NoSuchBucket: The specified bucket does not exist",
  "(?s).*Error creating SSM parameter: TooManyUpdates:.*",
  "(?s).*app.terraform.io.*: 429 Too Many Requests.*",
  "(?s).*ssh_exchange_identification.*Connection closed by remote host.*",
  "(?s).*Client\\.Timeout exceeded while awaiting headers.*",
  "(?s).*Could not download module.*The requested URL returned error: 429.*",
]
