resource "azurerm_virtual_network" "vnetaks" {  
  resource_group_name = var.resource_group_name
  name                = var.vnet_aks_name
  location            = var.location
  dns_servers         = var.vnet_aks_dns_list
  address_space       = var.vnet_adress_space  
}

resource "azurerm_subnet" "vnetakssubnet" {
  name                 = var.vnet_aks_subnet_name
  virtual_network_name = azurerm_virtual_network.vnetaks.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = var.vnet_aks_subnet_address
}


resource "azurerm_subnet" "vnetakssubnetilb" {
  name                 = var.vnet_aks_subnet_name_ilb
  virtual_network_name = azurerm_virtual_network.vnetaks.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = var.vnet_aks_subnet_address_ilb
}

resource "azurerm_subnet" "vnetakssubnetothers" {
  name                 = var.vnet_aks_subnet_name_others
  virtual_network_name = azurerm_virtual_network.vnetaks.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = var.vnet_aks_subnet_address_others
  
}


data "azurerm_monitor_diagnostic_categories" "vnet" {
  resource_id = azurerm_virtual_network.vnetaks.id
}


resource "azurerm_monitor_diagnostic_setting" "monitor_vnet_aks" {
    name = "vnet_aks_diagnostics"
    target_resource_id = azurerm_virtual_network.vnetaks.id
    log_analytics_workspace_id = data.terraform_remote_state.analyticsstate.outputs.loganalytics_id

    dynamic "log" {
    iterator = log_category
    for_each = data.azurerm_monitor_diagnostic_categories.vnet.logs

    content {
      category = log_category.value
      enabled  = true

      retention_policy {
        enabled = false
      }
    }
  }
}