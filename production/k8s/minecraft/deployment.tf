resource "kubernetes_deployment" "minecraft" {
  metadata {
    name = "minecraft"
    labels = {
      app = "minecraft"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "minecraft"
      }
    }

    strategy {
      type = "Recreate"
    }
    template {
      metadata {
        labels = {
          app      = "minecraft"
          app_type = "game"
        }
      }

      spec {
        container {
          name  = "minecraft"
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
            name       = "minecraft"
          }
        }

        volume {
          name = "minecraft"
          persistent_volume_claim {
            claim_name = "minecraft"
          }
        }

        image_pull_secrets {
          name = "regcred"
        }
      }
    }
  }
}
