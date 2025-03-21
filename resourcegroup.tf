resource "azurerm_resource_group" "RG_1" {
  name     = "Terraform_Infrastructure"
  location = "East US"
  tags = {
    Tower   = "Wintel"
    Owner   = "ValdesG"
    project = "Terraform"
  }
}
