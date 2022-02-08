resource "azurerm_user_assigned_identity" "aksuai" {
  resource_group_name = var.resource_group_name
  location            = var.location

  name = var.aksuai_name
}