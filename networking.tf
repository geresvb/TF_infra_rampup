#VNETS
resource "azurerm_virtual_network" "network_1" {
  name                = "Network-1"
  address_space       = ["10.0.0.0/24"]
  location            = azurerm_resource_group.RG_1.location
  resource_group_name = azurerm_resource_group.RG_1.name
}


#SUBNETS
resource "azurerm_subnet" "private_subnet" {
  name                 = "Private_subnet"
  resource_group_name  = azurerm_resource_group.RG_1.name
  virtual_network_name = azurerm_virtual_network.network_1.name
  address_prefixes     = ["10.0.0.8/29"]
}

resource "azurerm_subnet" "public_subnet" {
  name                 = "Public_subnet"
  resource_group_name  = azurerm_resource_group.RG_1.name
  virtual_network_name = azurerm_virtual_network.network_1.name
  address_prefixes     = ["10.0.0.16/29"]
}

resource "azurerm_subnet" "management_subnet" {
  name                 = "Management_subnet"
  resource_group_name  = azurerm_resource_group.RG_1.name
  virtual_network_name = azurerm_virtual_network.network_1.name
  address_prefixes     = ["10.0.0.24/29"]
}




#DELETE
resource "azurerm_public_ip" "PublicIP2" {
  name                = "PublicIP2"
  location            = azurerm_resource_group.RG_1.location
  resource_group_name = azurerm_resource_group.RG_1.name
  allocation_method   = "Static"
  sku                 = "Standard"
}
