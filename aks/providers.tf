terraform {
  required_version = "~> 1.1.2"
  backend "azurerm" {}
}


provider "azurerm" {
  version = "~> 2.85.0"
  features {} 
}

provider "kubernetes" {
  version                = "~> 2.7.1"
  host                   = azurerm_kubernetes_cluster.aks.kube_config[0].host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host = azurerm_kubernetes_cluster.aks.kube_config[0].host
    client_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate)
    client_key = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
    
  }
  debug = true
}