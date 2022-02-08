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

##################################
#  LOG ANALYTICS STORAGE ACCOUNT  #
##################################

variable "name_log_analytics" {
  description = "(Required) Log Analytics workspace name"
  default     = "log-analytics-workspace"
}

variable "solution_plan_map" {
  description = "(Optional) Map structure containing the list of solutions to be enabled."
  type        = map(any)
  default     = {}
}

variable "retention_in_days" {
  description = " (Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  type        = string
  default     = null
}


#################
#  KEY VAULUE   #
#################

variable "kv_aks_name" {
  type        = string
  description = "(Required) Name of key value"
}

variable "kv_enabled_for_disk_encryption" {
  type        = bool
  description = "(Required) Enable encription"
  default     = true
}


variable "kv_soft_delete_retention_days" {
  type        = number
  description = "(Required) Days soft delete"
  default     = 90
}

variable "kv_purge_protection_enabled" {
  type        = bool
  description = "(Required) Purge protection enabled"
  default     = true
}

variable "kv_sku_name" {
  type        = string
  description = "(Required) name of sku"
  default     = "standard"
}


variable "keyvault_key_permissions" {
  type    = list(string)
  default = ["get", "list", "update", "create", "import", "delete", "recover", "backup", "restore", "purge"]
}
variable "keyvault_secret_permissions" {
  type    = list(string)
  default = ["set", "get", "list", "delete", "recover", "backup", "restore", "purge"]
}
variable "keyvault_storage_permissions" {
  type    = list(string)
  default = ["get", "list", "delete", "recover", "backup", "restore", "set", "purge"]
}
variable "keyvault_certificate_permissions" {
  type    = list(string)
  default = ["get", "list", "update", "create", "import", "delete", "recover", "backup", "restore", "deleteissuers", "getissuers", "listissuers", "managecontacts", "manageissuers", "setissuers", "purge"]
}