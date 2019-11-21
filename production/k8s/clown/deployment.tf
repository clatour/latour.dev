resource "kubernetes_deployment" "clown" {
  metadata {
    name = "clown"
    labels = {
      app = "clown"
    }
  }

  spec {
    replicas               = 1
    revision_history_limit = 3

    selector {
      match_labels = {
        app = "clown"
      }
    }

    template {
      metadata {
        labels = {
          app      = "clown"
          app_type = "web"
        }
      }

      spec {
        container {
          name  = "clown"
          image = "${local.docker_registry}/clown:latest"

          port {
            container_port = 80
          }

          readiness_probe {
            initial_delay_seconds = 5
            period_seconds        = 10
            tcp_socket {
              port = 80
            }
          }
        }

        image_pull_secrets {
          name = "regcred"
        }
      }
    }
  }
}
