resource "kubernetes_deployment" "apt-cacher-ng" {
  metadata {
    name = "apt-cacher-ng"
    labels = {
      app = "apt-cacher-ng"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "apt-cacher-ng"
      }
    }

    template {
      metadata {
        labels = {
          app      = "apt-cacher-ng"
          app_type = "util"
        }
      }

      spec {
        container {
          name  = "apt-cacher-ng"
          image = "${local.docker_registry}/apt-cacher-ng:latest"


          port {
            container_port = local.container_port
          }

          readiness_probe {
            initial_delay_seconds = 5
            period_seconds        = 10
            tcp_socket {
              port = local.container_port
            }
          }

          volume_mount {
            mount_path = "/var/cache/apt-cacher-ng"
            name       = "apt-cacher-ng"
          }
        }

        volume {
          name = "apt-cacher-ng"
          persistent_volume_claim {
            claim_name = "apt-cacher-ng"
          }
        }

        image_pull_secrets {
          name = "regcred"
        }
      }
    }
  }
}
