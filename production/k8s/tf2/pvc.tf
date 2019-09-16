resource "kubernetes_persistent_volume_claim" "team-fortress-2" {
  metadata {
    name = local.name
  }

  spec {
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = "manual"
    resources {
      requests = {
        storage = "8Gi"
      }
    }
  }
}
