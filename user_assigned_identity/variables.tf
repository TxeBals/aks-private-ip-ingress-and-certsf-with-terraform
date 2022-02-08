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
  default     = "northeurope"
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

variable "aksuai_name"{
  description = "(Required) Name of user asssigned identity"
}