resource "azurerm_route_table" "udr" {
  name                          = var.udr_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = false


  route {
    name                   = var.udr_route_name_firewall
    address_prefix         = var.udr_route_address_prefix_firewall
    next_hop_type          = var.udr_route_hop_type_firewall
    next_hop_in_ip_address = var.udr_route_next_hop_in_ip_address #8.8.8.8 ip lan de firewall
  }  
}

resource "azurerm_subnet_route_table_association" "udrforakssnet" {
  subnet_id      = azurerm_subnet.vnetakssubnet.id	
  route_table_id = azurerm_route_table.udr.id
}

resource "azurerm_subnet_route_table_association" "udrforilbsnet" {
  subnet_id      = azurerm_subnet.vnetakssubnetilb.id
  route_table_id = azurerm_route_table.udr.id
}

resource "azurerm_subnet_route_table_association" "udrforotherssnet" {
  subnet_id      = azurerm_subnet.vnetakssubnetothers.id
  route_table_id = azurerm_route_table.udr.id
}