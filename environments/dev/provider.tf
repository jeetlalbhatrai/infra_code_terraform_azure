
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "donotdelete"
  #   storage_account_name = "todoinsidersstatess"
  #   container_name       = "tfstate"
  #   key                  = "dev.jeet-test.terraform.tfstate"
  #   subscription_id = "c060d854-01c4-4739-baf7-57540765c3d2"
  # }
}

provider "azurerm" {
  features {}
  # subscription_id = "c060d854-01c4-4739-baf7-57540765c3d2"
}