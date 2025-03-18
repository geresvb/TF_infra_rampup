resource "azurerm_resource_group" "RG_1" {
  name     = "Docker_Infrastructure1"
  location = "East US"
  tags = {
    Tower   = "Wintel"
    Owner   = "ValdesG"
    project = "Terraform"
  }
}
