terraform {
  # intentionally left blank, will be filled in by terragrunt
  backend "local" {}
}

provider "kubernetes" {
  host = "https://192.168.86.23:8443"

  client_certificate     = file("~/.minikube/client.crt")
  client_key             = file("~/.minikube/client.key")
  cluster_ca_certificate = file("~/.minikube/ca.crt")
}
