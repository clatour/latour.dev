remote_state {
  backend = "local"
  config = {
    path: "${pathexpand("~/tfstate")}/${path_relative_to_include()}/terraform.tfstate"
  }
}
