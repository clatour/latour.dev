resource "kubernetes_persistent_volume_claim" "gitea" {
  metadata {
    name = "gitea"
  }

  spec {
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = "manual"
    resources {
      requests = {
        storage = "5Gi"
      }
    }
  }
}
