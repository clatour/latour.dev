resource "kubernetes_service" "gitea" {
  metadata {
    name = "gitea"
  }

  spec {
    selector = {
      app = "gitea"
    }

    port {
      port = local.http_port
      name = "gitea-http"
    }

    port {
      port = local.ssh_port
      name = "gitea-ssh"
    }
  }
}
