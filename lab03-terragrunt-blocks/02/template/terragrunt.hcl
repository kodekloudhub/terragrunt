remote_state {
  backend =
  config = {
    encrypt        =
    bucket         =
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         =
    dynamodb_table =
  }
  generate = {
    path      =
    if_exists =
  }
}
