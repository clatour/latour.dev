resource "kubernetes_persistent_volume" "gitea" {
  metadata {
    name = "gitea"
    labels = {
      type = "local"
    }
  }

  spec {
    storage_class_name = "manual"
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = "5Gi"
    }

    persistent_volume_source {
      host_path {
        path = "/data/gitea"
      }
    }
  }
}
