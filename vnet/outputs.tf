output "vnetakssubnet_id" {
  description = "The ID of the subnet to use for the VNET AKS cluster"
  value       = azurerm_subnet.vnetakssubnet.id
}