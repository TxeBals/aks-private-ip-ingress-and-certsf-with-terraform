data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}

data "terraform_remote_state" "analyticsstate"{
    backend ="azurerm" 
    config = {
        #resoresource_group_name = data.azurerm_client_config.current.resource_group_name
        #storage_account_name = data.azurerm_client_config.current.storage_account
        #container_name = data.azurerm_client_config.current.container_name
        resource_group_name = format("%s",var.storage_resource_group)
        storage_account_name = format("%s",var.storage_account_name)
        container_name = format("%s",var.container_name)
        key = "terraform.loganalytics.tfstate"
        access_key =format("%s",var.storage_access)
    }
}
