resource "kubernetes_deployment" "mcmmo" {
  metadata {
    name = "mcmmo"
    labels = {
      app = "mcmmo"
    }
  }

  spec {
    replicas               = 1
    revision_history_limit = 3

    selector {
      match_labels = {
        app = "mcmmo"
      }
    }

    strategy {
      type = "Recreate"
    }

    template {
      metadata {
        labels = {
          app      = "mcmmo"
          app_type = "game"
        }
      }

      spec {
        container {
          name  = "mcmmo"
          image = "${local.docker_registry}/minecraft:latest"


          port {
            container_port = 25565
          }

          readiness_probe {
            initial_delay_seconds = 15
            period_seconds        = 30
            tcp_socket {
              port = 25565
            }
          }

          volume_mount {
            mount_path = "/opt/minecraft"
            name       = "mcmmo"
          }
        }

        volume {
          name = "mcmmo"
          persistent_volume_claim {
            claim_name = "mcmmo"
          }
        }

        image_pull_secrets {
          name = "regcred"
        }
      }
    }
  }
}
