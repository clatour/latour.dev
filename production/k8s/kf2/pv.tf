resource "kubernetes_persistent_volume" "killing-floor-2" {
  metadata {
    name = "killing-floor-2"
    labels = {
      type = "local"
    }
  }

  spec {
    storage_class_name = "manual"
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = "25Gi"
    }

    persistent_volume_source {
      host_path {
        path = "/data/steam-kf2"
      }
    }
  }
}
