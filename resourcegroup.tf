resource "azurerm_resource_group" "RG_1" {
  name     = "Terraform_Infra"
  location = "East US"
  tags = {
    Tower   = "Wintel"
    Owner   = "ValdesG"
    project = "Terraform"
  }
}
