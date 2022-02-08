output "loganalytics_id" {
  description = "Log Analytics workspace ID"
  value       = azurerm_log_analytics_workspace.log_analytics.id
}

output "keyvault_id" {
  description = "Key Vault ID"
  value       = azurerm_key_vault.akskeyvault.id
}