resource "kubernetes_ingress" "nginx-ingress" {
  metadata {
    name = "nginx-ingress"
    annotations = {
      "kubernetes.io/ingress.class"       = "nginx"
      "certmanager.k8s.io/cluster-issuer" = "letsencrypt-prod"
    }
  }

  spec {
    tls {
      hosts = [
        "matrix.latour.dev",
        "c.latour.dev"
      ]
    }

    rule {
      host = "matrix.latour.dev"
      http {
        path {
          backend {
            service_name = "ruma"
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
  }
}
