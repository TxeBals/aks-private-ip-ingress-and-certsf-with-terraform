terraform {
  required_version = "~> 1.1.2"
  backend "azurerm" {}
}


provider "azurerm" {
  version = "~> 2.85.0"
  features {}
 
}
