resource "kubernetes_deployment" "team-fortress-2" {
  metadata {
    name = local.name
    labels = {
      app = local.name
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = local.name
      }
    }

    strategy {
      type = "Recreate"
    }

    template {
      metadata {
        labels = {
          app      = local.name
          app_type = "game"
        }
      }

      spec {
        container {
          name  = local.name
          image = "${local.docker_registry}/ubuntu-tf2:latest"

          port { container_port = 27016 }
          port { container_port = 27020 }

          readiness_probe {
            initial_delay_seconds = 15
            period_seconds        = 30
            tcp_socket {
              port = 27016
            }
          }

          volume_mount {
            mount_path = "/home/steam/games"
            name       = local.name
          }
        }

        volume {
          name = local.name
          persistent_volume_claim {
            claim_name = local.name
          }
        }

        image_pull_secrets {
          name = "regcred"
        }
      }
    }
  }
}
