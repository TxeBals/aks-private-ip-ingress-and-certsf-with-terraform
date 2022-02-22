#Susbscrition information
variable "subscriptionID" {
  description = "(Required)"
}

variable "clientID" {
  description = "(Required)"
  default     = ""
}

variable "clientSecret" {
  description = "(Required)"
  default     = ""
}

variable "TenantID" {
  description = "(Required)"
  default     = ""
}

variable "ObjectID" {
  description = "(Required)"
  default     = ""
}

#Commons
variable "location" {
  description = "(Required) Location of the all services to be created"
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "(Required) Resource group name of the all services to be created"
}

variable "resource_group_id" {
  description = "(Required) Identify resource group"
}

variable "tags" {
  description = "(Required) Tags to be applied to the all services to be created"
  default     = { Project = "condorcloud-pre" }
}


###################################
#       DATA VARIABLES
###################################

variable "storage_resource_group" {
  type     = string
  description = "Resource group name of the storage account"
  default     = "rg-condorcloud-tfstate-pre"
}

variable "storage_account_name" {
  description = "(Required) Storage account name"
  default     = "staaks"
}

variable "container_name" {
  description = "(Required) Container name"
  default    = "terraform-state-pre"
}

variable "storage_access" {
  description = "(Required) Storage access key"
  default     = ""
  
}



############################
#  VARIABLES DE VNET Y SUBNETS
############################

variable "vnet_aks_name" {
  type = string
  description = "(Required) Name of vnet of aks"
}

variable "vnet_aks_dns_list" {
  type        = list(string)
  description = "(Required) list of dns servers"
}

variable "vnet_adress_space" {
  type = list(string)
  description = "(Required) Adress space of vnet"
}

variable "vnet_aks_subnet_name" {
  type = string
  description = "(Required) name of subnet"
}

variable "vnet_aks_subnet_address" {
  type = list(string)
  description = "(Required) subnet address range"
}

variable "vnet_aks_subnet_name_ilb" {
  type = string
  description = "(Required) name of subnet for ILB of AKS"
}

variable "vnet_aks_subnet_address_ilb" {
  type = list(string)
  description = "(Required) subnet address range for ILB of AKS"
}


variable  "vnet_aks_subnet_name_others" {
  type = string
  description = "(Required) Name of subnet for others use"
}

variable "vnet_aks_subnet_address_others" {
  type = list(string)
  description = "(Required) subnet address range for others use"
}

#######################################
#  VARIABLES DE NETWORK SECURITY GROUPS
#######################################

variable "nsg_name" {
  description = "(Required) Name of the NSG to be created"
  default     = "nsg-vnet"
}

#######################################
#  VARIABLES DE USER DEFINED ROUTES
#######################################

variable "udr_name" {
  type = string
  description = "(Required) Udr name "
}

variable "udr_route_name" {
  type = string
  description = "(Required) Udr route vnet local name"
}

variable "udr_route_address_prefix" {
  type = string
  description = "(Required) Udr route vnet local address prefix"
}

variable "udr_route_hop_type" {
  type = string
  description = "(Required) Udr route vnet hop type"
}

variable "udr_route_name_firewall" {
  type = string
  description = "(Required) Udr route vnet firewall name"
}

variable "udr_route_address_prefix_firewall" {
  type = string
  description = "(Required) Udr route vnet firewall address prefix"
}


variable "udr_route_hop_type_firewall" {
  type = string
  description = "(Required) Udr route vnet firewall hope type"
}

variable "udr_route_next_hop_in_ip_address" {
  type = string
  description = "(Required) Udr route vnet firewall hope in ip address"
}
