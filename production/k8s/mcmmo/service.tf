resource "kubernetes_service" "mcmmo" {
  metadata {
    name = "mcmmo"
  }

  spec {
    selector = {
      app = "mcmmo"
    }

    port {
      port      = local.container_port
      protocol  = "UDP"
      name      = "minecraft-udp"
    }

    port {
      port      = local.container_port
      protocol  = "TCP"
      name      = "minecraft-tcp"
    }
  }
}
