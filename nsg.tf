resource "azurerm_network_security_group" "private_sg" {
  name                = "private_sg"
  location            = azurerm_resource_group.RG_1.location
  resource_group_name = azurerm_resource_group.RG_1.name
  #Allow 5432
  security_rule {
    name                       = "Allow_5342_Everywhere"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5342"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

    security_rule {
    name                       = "Allow_3000_Everywhere"
    priority                   = 1006
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

      security_rule {
    name                       = "Allow_3001_Everywhere"
    priority                   = 1007
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3001"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


  # Allow SSH from anywhere to 10.0.0.20 and 10.0.0.28
  security_rule {
    name                         = "Allow_Outside_SSH"
    priority                     = 1001
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "Tcp"
    source_port_range            = "*"
    destination_port_range       = "22"
    source_address_prefix        = "*"
    destination_address_prefixes = ["10.0.0.20", "10.0.0.28"]
  }

  # Allow SSH from 10.0.0.28 to 10.0.0.20 and 10.0.0.13
  security_rule {
    name                         = "SSH-Management-Frontend-Backend"
    priority                     = 1002
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "Tcp"
    source_port_range            = "*"
    destination_port_range       = "22"
    source_address_prefix        = "10.0.0.28"
    destination_address_prefixes = ["10.0.0.20", "10.0.0.13"]
  }



  # Allow SSH from 10.0.0.20 to 10.0.0.13
  security_rule {
    name                       = "SSH-Frontend-Backend"
    priority                   = 1004
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.0.20"
    destination_address_prefix = "10.0.0.13"
  }

  # Allow SSH from 10.0.0.13 to 10.0.0.12
  security_rule {
    name                       = "SSH-Backend-DB"
    priority                   = 1005
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.0.13"
    destination_address_prefix = "10.0.0.12"
  }

  # Deny all other inbound traffic
  # security_rule {
  #   name                       = "Deny_All_Other_Inbound"
  #   priority                   = 2000
  #   direction                  = "Inbound"
  #   access                     = "Deny"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "*"
  # }

}
