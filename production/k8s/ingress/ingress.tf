resource "kubernetes_ingress" "nginx-ingress" {
  metadata {
    name = "nginx-ingress"
    annotations = {
      "kubernetes.io/ingress.class"                 = "nginx"
      "certmanager.k8s.io/cluster-issuer"           = "letsencrypt-prod"
      "nginx.ingress.kubernetes.io/ssl-redirect"    = "false"
      "nginx.ingress.kubernetes.io/proxy-body-size" = "50m"
    }
  }

  spec {
    tls {
      hosts = [
        "latour.dev",
        "c.latour.dev",
        "apt.latour.dev",
        "git.latour.dev",
      ]
      secret_name = "letsencrypt-prod"
    }

    rule {
      host = "git.latour.dev"
      http {
        path {
          backend {
            service_name = "gitea"
            service_port = 3000
          }
        }
      }
    }

    rule {
      host = "c.latour.dev"
      http {
        path {
          backend {
            service_name = "web"
            service_port = 8080
          }
        }
      }
    }

    rule {
      host = "latour.dev"
      http {
        path {
          backend {
            service_name = "web"
            service_port = 8080
          }
        }
      }
    }

    rule {
      host = "apt.latour.dev"
      http {
        path {
          backend {
            service_name = "apt-cacher-ng"
            service_port = 3142
          }
        }
      }
    }
  }
}
