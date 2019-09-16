resource "kubernetes_service" "team-fortress-2" {
  metadata {
    name = local.name
  }

  spec {
    selector = {
      app = local.name
    }

    port {
      port      = 27016
      node_port = 30200
      protocol  = "UDP"
      name      = "main-connection"
    }

    port {
      port      = 27016
      node_port = 30200
      protocol  = "TCP"
      name      = "remote-connection"
    }

    port {
      port      = 27020
      node_port = 30201
      protocol  = "UDP"
      name      = "steam-port"
    }

    type = "NodePort"
  }
}
