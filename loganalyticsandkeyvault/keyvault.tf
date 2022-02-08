resource "azurerm_key_vault" "akskeyvault" {
  name                        = var.kv_aks_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = var.kv_enabled_for_disk_encryption
  tenant_id                   = var.TenantID
  soft_delete_retention_days  = var.kv_soft_delete_retention_days
  purge_protection_enabled    = var.kv_purge_protection_enabled

  sku_name = var.kv_sku_name

}

resource "azurerm_key_vault_access_policy" "akskeyvaulpolicy" {
  key_vault_id = azurerm_key_vault.akskeyvault.id
  tenant_id    = var.TenantID
  object_id    = var.ObjectID

  key_permissions         = var.keyvault_key_permissions
  secret_permissions      = var.keyvault_secret_permissions
  storage_permissions     = var.keyvault_storage_permissions
  certificate_permissions = var.keyvault_certificate_permissions
}

resource "azurerm_key_vault_access_policy" "service_principal" { 
  key_vault_id        = azurerm_key_vault.akskeyvault.id
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
  secret_permissions  = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set", ]
  key_permissions     = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", ]
  storage_permissions = ["Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update", ]
}
