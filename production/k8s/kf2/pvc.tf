resource "kubernetes_persistent_volume_claim" "killing-floor-2" {
  metadata {
    name = "killing-floor-2"
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    storage_class_name = "manual"
    resources {
      requests = {
        storage = "22Gi"
      }
    }
  }
}
