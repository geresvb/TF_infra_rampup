#Network Interfaces Cards

#NIC DB
resource "azurerm_network_interface" "nic_1" {
  name                = "NIC_DB"
  location            = azurerm_resource_group.RG_1.location
  resource_group_name = azurerm_resource_group.RG_1.name

  ip_configuration {
    name                          = "NIC_DB"
    subnet_id                     = azurerm_subnet.private_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.0.36"
  }
}

#Network Security group association
resource "azurerm_network_interface_security_group_association" "nic_1_to_privatesg" {
  network_interface_id      = azurerm_network_interface.nic_1.id
  network_security_group_id = azurerm_network_security_group.private_sg.id
}


#NIC backend
resource "azurerm_network_interface" "nic_2" {
  name                = "NIC_Backend"
  location            = azurerm_resource_group.RG_1.location
  resource_group_name = azurerm_resource_group.RG_1.name

  ip_configuration {
    name                          = "NIC_Backend"
    subnet_id                     = azurerm_subnet.private_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.0.37"
  }
}

#Network Security group association
resource "azurerm_network_interface_security_group_association" "nic_2_to_privatesg" {
  network_interface_id      = azurerm_network_interface.nic_2.id
  network_security_group_id = azurerm_network_security_group.private_sg.id
}



#NIC frontend
resource "azurerm_network_interface" "nic_3" {
  name                = "NIC_Frontend"
  location            = azurerm_resource_group.RG_1.location
  resource_group_name = azurerm_resource_group.RG_1.name

  ip_configuration {
    name                          = "NIC_Frontend"
    subnet_id                     = azurerm_subnet.public_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.0.68"
  }
}

#Network Security group association
resource "azurerm_network_interface_security_group_association" "nic_3_to_privatesg" {
  network_interface_id      = azurerm_network_interface.nic_3.id
  network_security_group_id = azurerm_network_security_group.private_sg.id
}



#NIC frontend
resource "azurerm_network_interface" "nic_4" {
  name                = "NIC_Management"
  location            = azurerm_resource_group.RG_1.location
  resource_group_name = azurerm_resource_group.RG_1.name

  ip_configuration {
    name                          = "NIC_Management"
    subnet_id                     = azurerm_subnet.management_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.0.100"
    public_ip_address_id          = azurerm_public_ip.PublicIP2.id
  }
}

#Network Security group association
resource "azurerm_network_interface_security_group_association" "nic_4_to_privatesg" {
  network_interface_id      = azurerm_network_interface.nic_4.id
  network_security_group_id = azurerm_network_security_group.private_sg.id
}
