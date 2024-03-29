resource "kubernetes_service" "minecraft" {
  metadata {
    name = "minecraft"
  }

  spec {
    selector = {
      app = "minecraft"
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
