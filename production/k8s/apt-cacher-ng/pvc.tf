resource "kubernetes_persistent_volume_claim" "apt-cacher-ng" {
  metadata {
    name = "apt-cacher-ng"
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
