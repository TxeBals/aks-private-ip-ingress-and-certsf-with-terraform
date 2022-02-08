resource_group_name                             = ""
resource_group_id                               = ""
subscriptionID                                  = ""
tags                                            = { Project = "" }


##########################
# LOG ANALYTICS
##########################
name_log_analytics="log-analytics-name"
solution_plan_map={}
retention_in_days=60

##########################
# KEYVAULT
##########################
kv_aks_name                                     = "kv-aks-name"
kv_enabled_for_disk_encryption                  =true
kv_soft_delete_retention_days                   =90
kv_purge_protection_enabled                     =true
kv_sku_name                                     ="standard"