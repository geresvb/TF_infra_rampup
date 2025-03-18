# Virtual Machines
resource "azurerm_linux_virtual_machine" "dbvm" {
  name                  = "DB-VM1"
  resource_group_name   = azurerm_resource_group.RG_1.name
  location              = azurerm_resource_group.RG_1.location
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  network_interface_ids = [azurerm_network_interface.nic_1.id]

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.db_ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  custom_data = base64encode(file("./cloudinit/database.yaml"))
}

# Repeat for other VMs

resource "azurerm_linux_virtual_machine" "backendvm" {
  name                  = "Backend-VM1"
  resource_group_name   = azurerm_resource_group.RG_1.name
  location              = azurerm_resource_group.RG_1.location
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  network_interface_ids = [azurerm_network_interface.nic_1.id]

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.backend_ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  custom_data = base64encode(file("./cloudinit/backend.yaml"))
}

resource "azurerm_linux_virtual_machine" "frontendvm" {
  name                  = "Frontend-VM1"
  resource_group_name   = azurerm_resource_group.RG_1.name
  location              = azurerm_resource_group.RG_1.location
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  network_interface_ids = [azurerm_network_interface.nic_1.id]

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.frontend_ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  custom_data = base64encode(file("./cloudinit/frontend.yaml"))
}

resource "azurerm_linux_virtual_machine" "managementvm" {
  name                  = "Management-VM1"
  resource_group_name   = azurerm_resource_group.RG_1.name
  location              = azurerm_resource_group.RG_1.location
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  network_interface_ids = [azurerm_network_interface.nic_1.id]

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.management_ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  custom_data = base64encode(file("./cloudinit/management.yaml"))
}

# Variables for SSH Keys
variable "db_ssh_public_key" {}
variable "backend_ssh_public_key" {}
variable "frontend_ssh_public_key" {}
variable "management_ssh_public_key" {}
