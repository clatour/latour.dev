resource "kubernetes_service" "clown" {
  metadata {
    name = "clown"
  }

  spec {
    selector = {
      app = "clown"
    }

    port {
      port      = 80
      name      = "nginx-http"
    }
  }
}
