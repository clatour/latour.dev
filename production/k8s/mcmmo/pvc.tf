resource "kubernetes_persistent_volume_claim" "mcmmo" {
  metadata {
    name = "mcmmo"
  }

  spec {
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = "manual"
    resources {
      requests = {
        storage = "10Gi"
      }
    }
  }
}
