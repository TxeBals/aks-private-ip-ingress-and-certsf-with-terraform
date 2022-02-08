resource "kubernetes_namespace" "aks_namespace_ingress" {
  metadata {
    name = "ingress"
  }
}
