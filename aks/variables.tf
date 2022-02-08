#Susbscrition information
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

###################################
#       DATA VARIABLES
###################################

variable "storage_resource_group" {
  type     = string
  description = "Resource group name of the storage account"
  default     = ""
}

variable "storage_account_name" {
  description = "(Required) Storage account name"
  default     = ""
}

variable "container_name" {
  description = "(Required) Container name"
  default    = ""
}

variable "storage_access" {
  description = "(Required) Storage access key"
  default     = ""
  
}

###################################
#       AKS VARIABLES
###################################
variable "aks_name" {
  description = "(Required) Name of the Kuberentes cluster"
}

variable "dns_prefix" {
  type        = string
  description = "(Optional) DNS prefix to append to the cluster. Default: name of the cluster"
  default     = null
}

variable "kubernetes_version" {
  type        = string
  description = "(Required) Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). NOTE: Upgrading your cluster may take up to 10 minutes per node."
  default     = "1.22.4"
}

variable "api_server_authorized_ip_ranges" {
  type        = list(string)
  description = "(Optional) The IP ranges to whitelist for incoming traffic to the masters."
  default     = null
}

variable "node_pool_name" {
  type        = string
  description = "(Optional) Node Pool name. Default: default"
  default     = "node-pool-name"
}

variable "node_pool_count" {
  type        = number
  description = "(Optional) Number of pool virtual machines to create. Default: 3"
  default     = 1
}

variable "node_pool_vm_size" {
  type        = string
  description = "(Optional) VM Size to create in the default node pool. Default: Standard_DS3_v2"
  default     = "Standard_DS3_v2"
}

variable "node_pool_max_pods" {
  type        = number
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  default     = 60
}

variable "node_pool_os_disk_size_gb" {
  type        = number
  description = "(Optional) The size of the OS Disk which should be used for each agent in the Node Pool. Changing this forces a new resource to be created. Default: 60"
  default     = 60
}

variable "aks_availability_zones" {
  type        = list(string)
  description = "(Required) Availabilty zones"
  default     = ["1", "2", "3"]
}

variable "auto_scaling_enable" {
  type        = bool
  description = "(Optional) Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false."
  default     = true
}

variable "auto_scaling_min_count" {
  type        = number
  description = "(Optional) The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100"
  default     = 1
}

variable "auto_scaling_max_count" {
  type        = number
  description = "(Optional) The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100."
  default     = 3
}

variable "linux_admin_username" {
  type        = string
  description = "(Optional) The Admin Username for the Cluster. Changing this forces a new resource to be created. Defaults to cloudcommons"
  default     = "admin-name"
}

variable "linux_ssh_key" {
  type        = string
  description = "(Optional) The Public SSH Key used to access the cluster. Changing this forces a new resource to be created."
  default     = null
}

variable "network_plugin" {
  type        = string
  description = "(Optional) Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created. Defaults to calico"
  default     = "azure"
}

variable "network_policy" {
  type        = string
  description = "(Optional) Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. This field can only be set when network_plugin is set to azure. Currently supported values are calico and azure. Changing this forces a new resource to be created. Defaults to calico"
  default     = "azure"
}

variable "network_load_balancer_sku" {
  type        = string
  description = "(Optional) Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are basic and standard. Defaults to basic."
  default     = "Standard"
}

variable "aks_udr_config"{
  type = string
  description = "Type of outbound traffic configuration"
  default = "userDefinedRouting"
}

variable "http_application_routing_enabled" {
  type        = bool
  description = "(Optional) Enables http application routing"
  default     = false
}


variable "aks_private_ip"{
  type = string
  description = "Private IP of the AKS ingress controller"  
}

variable "cert_path"{
  type = string
  description = "(Required) Path to the certificate"  
}

variable "key_path"{
  type = string
  description = "(Required) Path to the key for certificate"  
} 


variable "ssl_name" {
  type        = string
  description = "(Required) Name of the SSL certificate. Defaults to null"
}

variable "ssl_namespace"{
  type = string
  description = "(Required) Namespace of the SSL certificate"
}