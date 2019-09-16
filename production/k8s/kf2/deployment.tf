resource "kubernetes_deployment" "killing-floor-2" {
  metadata {
    name = "killing-floor-2"
    labels = {
      app = "killing-floor-2"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "killing-floor-2"
      }
    }

    template {
      metadata {
        labels = {
          app      = "killing-floor-2"
          app_type = "game"
        }
      }

      spec {
        container {
          name  = "killing-floor-2"
          image = "${local.docker_registry}/ubuntu-kf2:latest"

          port { container_port = 7777 }
          port { container_port = 8080 }
          port { container_port = 27015 }
          port { container_port = 20560 }

          volume_mount {
            mount_path = "/home/steam/games"
            name       = "killing-floor-2"
          }
        }

        volume {
          name = "killing-floor-2"
          persistent_volume_claim {
            claim_name = "killing-floor-2"
          }
        }

        image_pull_secrets {
          name = "regcred"
        }
      }
    }
  }
}
