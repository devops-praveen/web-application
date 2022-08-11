terraform {
  backend "azurerm" {
    resource_group_name  = "test-rg"
    storage_account_name = "tfbackup"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}