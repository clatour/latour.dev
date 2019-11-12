resource "kubernetes_deployment" "bungee-cord" {
  metadata {
    name = "bungee-cord"
    labels = {
      app = "bungee-cord"
    }
  }

  spec {
    replicas               = 1
    revision_history_limit = 3

    selector {
      match_labels = {
        app = "bungee-cord"
      }
    }

    strategy {
      type = "Recreate"
    }

    template {
      metadata {
        labels = {
          app      = "bungee-cord"
          app_type = "game"
        }
      }

      spec {
        container {
          name  = "bungee-cord"
          image = "${local.docker_registry}/bungee-cord:latest"

          port {
            container_port = 25565
          }

          readiness_probe {
            initial_delay_seconds = 5
            period_seconds        = 10
            tcp_socket {
              port = 25565
            }
          }

          volume_mount {
            mount_path = "/opt/minecraft"
            name       = "bungee-cord"
          }
        }

        volume {
          name = "bungee-cord"
          empty_dir {
            medium = ""
          }
        }

        image_pull_secrets {
          name = "regcred"
        }
      }
    }
  }
}
