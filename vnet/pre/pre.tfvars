resource_group_name                             = "myResourceGroup"
tags                                            = { Project = "" }


###################################
#       DATA VARIABLES
###################################

storage_account_name                            = ""
container_name                                  = ""
storage_resource_group                          =""
storage_access                                  =""


############################
#  VARIABLES DE VNET Y SUBNETS
############################

vnet_aks_dns_list                               = ["168.63.129.16"]
vnet_aks_name                                   = "vnet-aks-address-space"
vnet_adress_space                               = ["10.80.180.0/23"]
vnet_aks_subnet_name                            = "snet-aks"
vnet_aks_subnet_address                         = ["10.80.180.0/24"]
vnet_aks_subnet_name_ilb                        = "snet-ilb-aks"
vnet_aks_subnet_address_ilb                     = ["10.80.181.128/26"]
vnet_aks_subnet_name_others                     = "snet-others"
vnet_aks_subnet_address_others                  = ["10.80.181.0/25"]

#######################################
#  VARIABLES DE NETWORK SECURITY GROUPS
#######################################

nsg_name                                        = "nsg-vnet" 


#######################################
#  VARIABLES DE USER DEFINED ROUTES
#######################################
udr_name                                        = "udr-aks-to-vnet"
udr_route_name                                  = "aksRoutingVnet"
udr_route_address_prefix                        = "10.1.0.0/16"
udr_route_hop_type                              = "vnetlocal"
udr_route_name_firewall                         = "aksToFirewall"
udr_route_address_prefix_firewall               = "0.0.0.0/0"
udr_route_hop_type_firewall                     = "VirtualAppliance"
udr_route_next_hop_in_ip_address                = "your vnet ip address"