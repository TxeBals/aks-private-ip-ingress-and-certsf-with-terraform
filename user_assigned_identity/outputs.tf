output "uai_id" {
  description = "The ID of user assigned identity"
  value       = azurerm_user_assigned_identity.aksuai.id
}


output "uai_principal_id" {
  description = "The Principal ID of user assigned identity"
  value       = azurerm_user_assigned_identity.aksuai.principal_id
}

output "uai_client_id" {
  description = "The Client ID of user assigned identity"
  value       = azurerm_user_assigned_identity.aksuai.client_id
}
  