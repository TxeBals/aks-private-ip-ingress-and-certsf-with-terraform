resource_group_name                             = ""
tags                                            = { Project = "" }

###################################
#       DATA VARIABLES
###################################

storage_account_name                            = ""
container_name                                  = ""
storage_resource_group                          =""
storage_access                                  =""

###############################
#      AKS 
###############################
aks_name                                        = "aks-name-pre"
aks_private_ip                                  ="10.80.181.132"

###############################
#      AKS CERTOFICATES 
###############################

cert_path                                       ="./pre/cert/{yourcertificatename}.cer"
key_path                                        ="./pre/cert/{yourkey}.key"
ssl_name                                        ="ssl-certificate-pre"
ssl_namespace                                   ="ingress"