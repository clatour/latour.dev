resource "kubernetes_service" "apt-cacher-ng" {
  metadata {
    name = "apt-cacher-ng"
  }

  spec {
    selector = {
      app = "apt-cacher-ng"
    }

    port {
      port = local.container_port
      name = "apt-cacher-ng"
    }
  }
}
