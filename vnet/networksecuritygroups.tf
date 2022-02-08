resource "azurerm_network_security_group" "nsg_snet" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "nsg_snet_aks_association" {
  subnet_id                 = azurerm_subnet.vnetakssubnet.id
  network_security_group_id = azurerm_network_security_group.nsg_snet.id
}

resource "azurerm_subnet_network_security_group_association" "nsg_snet_ilb_association" {
  subnet_id                 = azurerm_subnet.vnetakssubnetilb.id
  network_security_group_id = azurerm_network_security_group.nsg_snet.id
}


resource "azurerm_subnet_network_security_group_association" "nsg_snet_others_association" {
  subnet_id                 = azurerm_subnet.vnetakssubnetothers.id
  network_security_group_id = azurerm_network_security_group.nsg_snet.id
}