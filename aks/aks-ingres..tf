resource "helm_release" "ingress" {
  name             = "ingress"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress"
  version          = "4.0.13"
  timeout          = 180
  create_namespace = true
  force_update     = true 


  values = [file("pre/aks-ingress-values.yaml")]
  

  
  set {
    name  = "controller.service.loadBalancerIP"
    value = var.aks_private_ip
  }

  set {
    name  = "controller.replicaCount"
    value = "2"
  }

  set {
    name  = "controller.kind"
    value = "DaemonSet"
  }

  set {
    name  = "controller.daemonset.useHostPort"
    value = "false"
  }

  set {
    # name  = "controller.nodeSelector\\.beta.kubernetes.io/os"
    name  = "controller.nodeSelector\\kubernetes.io/os"
    value = "linux"
  }

  set {
    # name  = "defaultBackend.nodeSelector\\.beta.kubernetes.io/os"
    name  = "defaultBackend.nodeSelector\\kubernetes.io/os"
    value = "linux"
  }

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}