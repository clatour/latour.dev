resource "kubernetes_deployment" "gitea" {
  metadata {
    name = "gitea"
    labels = {
      app = "gitea"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "gitea"
      }
    }

    template {
      metadata {
        labels = {
          app      = "gitea"
          app_type = "util"
        }
      }

      spec {
        container {
          name  = "gitea"
          image = "gitea/gitea:latest"


          port {
            container_port = local.http_port
          }

          port {
            container_port = local.ssh_port
          }

          readiness_probe {
            initial_delay_seconds = 5
            period_seconds        = 10
            tcp_socket {
              port = local.http_port
            }
          }

          volume_mount {
            mount_path = "/data"
            name       = "gitea"
          }
        }

        volume {
          name = "gitea"
          persistent_volume_claim {
            claim_name = "gitea"
          }
        }
      }
    }
  }
}
