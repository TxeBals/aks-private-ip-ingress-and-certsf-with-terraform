# Create an Azure Kubernetes Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                            = var.aks_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  dns_prefix                      = try(var.dns_prefix, null) != null ? var.dns_prefix : var.aks_name
  kubernetes_version              = var.kubernetes_version
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  

  default_node_pool {
    name                  = var.node_pool_name
    node_count            = var.node_pool_count
    enable_node_public_ip = false
    vm_size               = var.node_pool_vm_size
    max_pods              = var.node_pool_max_pods
    os_disk_size_gb       = var.node_pool_os_disk_size_gb
    vnet_subnet_id        = data.terraform_remote_state.vnetstate.outputs.vnetakssubnet_id
    availability_zones    = var.aks_availability_zones
    enable_auto_scaling   = var.auto_scaling_enable
    min_count             = var.auto_scaling_enable == true ? var.auto_scaling_min_count : null
    max_count             = var.auto_scaling_enable == true ? var.auto_scaling_max_count : null
  }

  dynamic "linux_profile" {
    for_each = try(var.linux_ssh_key, null) != null ? [1] : []
    content {
      admin_username = var.linux_admin_username
      ssh_key {
        key_data = var.linux_ssh_key
      }
    }
  }

  network_profile {
    network_plugin    = var.network_plugin
    network_policy    = var.network_policy
    load_balancer_sku = var.network_load_balancer_sku
    outbound_type     = var.aks_udr_config
  }

 role_based_access_control {
    # azure_active_directory {
    #   admin_group_object_ids = [data.azuread_group.global_admins.id]
    #   managed                = true
    # }
    enabled = true
  }

  identity {
    type = "UserAssigned"
    user_assigned_identity_id = data.terraform_remote_state.uaistate.outputs.uai_id    
  }
  
  # kubelet_identity {
  #   client_id                 = data.terraform_remote_state.uaistate.outputs.uai_client_id
  #   object_id                 = data.terraform_remote_state.uaistate.outputs.uai_principal_id 
  #   user_assigned_identity_id = data.terraform_remote_state.uaistate.outputs.uai_id 
  # }


  addon_profile {
    http_application_routing {
      enabled = var.http_application_routing_enabled
    }
    kube_dashboard {
      enabled = false
    }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = data.terraform_remote_state.analyticsstate.outputs.loganalytics_id
    }
  }

  tags = var.tags

}

# resource "azurerm_role_assignment" "aks_subnet" {
#   scope                = data.terraform_remote_state.vnetstate.outputs.vnetakssubnet_id
#   role_definition_name = "Network Contributor"
#   principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
# }

