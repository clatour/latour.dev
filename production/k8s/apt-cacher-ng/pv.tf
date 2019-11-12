resource "kubernetes_persistent_volume" "apt-cacher-ng" {
  metadata {
    name = "apt-cacher-ng"
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
        path = "/data/apt-cacher-ng"
      }
    }
  }
}
