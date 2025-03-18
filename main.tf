provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"

  tags = {
    owner   = "valdesg"
    tower   = "Wintel"
    project = "Terraform"
  }
}
