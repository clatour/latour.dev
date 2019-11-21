resource "kubernetes_ingress" "nginx-ingress" {
  metadata {
    name = "nginx-ingress"
    annotations = {
      "kubernetes.io/ingress.class"                 = "nginx"
      "nginx.ingress.kubernetes.io/proxy-body-size" = "500m"
    }
  }

  spec {
    # tls {
    #   hosts = [
    #     "registry.latour.dev",
    #     "latour.dev",
    #     "git.latour.dev",
    #     "apt.latour.dev",
    #   ]
    #   secret_name = "letsencrypt-prod"
    # }

    tls {
      hosts = [
        "clown.engineer",
      ]
      secret_name = "clown-crt-secret"
    }

    tls {
      hosts = [
        "registry.latour.dev",
      ]
      secret_name = "registry-crt-secret"
    }

    tls {
      hosts = [
        "git.latour.dev",
      ]
      secret_name = "git-crt-secret"
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
      host = "clown.engineer"
      http {
        path {
          backend {
            service_name = "clown"
            service_port = 80
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

    rule {
      host = "registry.latour.dev"
      http {
        path {
          backend {
            service_name = "docker-registry"
            service_port = 5000
          }
        }
      }
    }
  }
}
