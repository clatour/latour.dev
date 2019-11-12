resource "kubernetes_service" "bungee-cord" {
  metadata {
    name = "bungee-cord"
  }

  spec {
    selector = {
      app = "bungee-cord"
    }

    port {
      port      = local.container_port
      node_port = local.service_port
      protocol  = "UDP"
      name      = "minecraft-udp"
    }

    port {
      port      = local.container_port
      node_port = local.service_port
      protocol  = "TCP"
      name      = "minecraft-tcp"
    }

    type = "NodePort"
  }
}
