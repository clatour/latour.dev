resource "kubernetes_persistent_volume" "team-fortress-2" {
  metadata {
    name = local.name
    labels = {
      type = "local"
    }
  }

  spec {
    storage_class_name = "manual"
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = "10Gi"
    }

    persistent_volume_source {
      host_path {
        path = "/data/steam-tf2"
      }
    }
  }
}
