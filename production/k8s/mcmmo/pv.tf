resource "kubernetes_persistent_volume" "mcmmo" {
  metadata {
    name = "mcmmo"
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
        path = "/data/mcmmo"
      }
    }
  }
}
