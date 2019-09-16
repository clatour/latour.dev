resource "kubernetes_service" "killing-floor-2" {
  metadata {
    name = "killing-floor-2"
  }

  spec {
    selector = {
      app = "killing-floor-2"
    }

    port {
      port      = 7777
      node_port = 30100
      protocol  = "UDP"
      name      = "game-port"
    }

    port {
      port      = 27015
      node_port = 30101
      protocol  = "UDP"
      name      = "query-port"
    }

    port {
      port      = 20560
      node_port = 30102
      protocol  = "UDP"
      name      = "steam-port"
    }

    port {
      port      = 8080
      node_port = 30103
      protocol  = "TCP"
      name      = "web-port"
    }

    type = "NodePort"
  }
}
