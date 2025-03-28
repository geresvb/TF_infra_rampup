# Variables for SSH Keys
variable "db_ssh_public_key" {}
variable "backend_ssh_public_key" {}
variable "frontend_ssh_public_key" {}
variable "management_ssh_public_key" {}


# DB
resource "azurerm_linux_virtual_machine" "dbvm" {
  name                = "DB-VM1"
  resource_group_name = azurerm_resource_group.RG_1.name
  location            = azurerm_resource_group.RG_1.location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic_1.id
  ]

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

# Backend
resource "azurerm_linux_virtual_machine" "BackendVM" {
  name                = "Backend-VM1"
  resource_group_name = azurerm_resource_group.RG_1.name
  location            = azurerm_resource_group.RG_1.location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic_2.id
  ]

  depends_on = [azurerm_linux_virtual_machine.dbvm]
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

# Frontend
resource "azurerm_linux_virtual_machine" "FrontendVM" {
  name                = "Frontend-VM1"
  resource_group_name = azurerm_resource_group.RG_1.name
  location            = azurerm_resource_group.RG_1.location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic_3.id
  ]

  depends_on = [azurerm_linux_virtual_machine.dbvm]
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

# Management
resource "azurerm_linux_virtual_machine" "ManagementVM" {
  name                = "Management-VM1"
  resource_group_name = azurerm_resource_group.RG_1.name
  location            = azurerm_resource_group.RG_1.location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic_4.id
  ]

  depends_on = [azurerm_linux_virtual_machine.dbvm]
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

  custom_data = base64encode(templatefile("${path.module}/cloudinit/management.yaml.tmpl", {
    backend_token  = var.backend_runner_token,
    frontend_token = var.frontend_runner_token
  }))
}

variable "backend_runner_token" {
  description = "GitHub registration token for backend runner"
  type        = string
  sensitive   = true
}

variable "frontend_runner_token" {
  description = "GitHub registration token for frontend runner"
  type        = string
  sensitive   = true
}
