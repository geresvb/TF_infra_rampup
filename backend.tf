terraform {
  backend "azurerm" {
    resource_group_name   = "TerraformRG"
    storage_account_name  = "terraformbackend456"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
