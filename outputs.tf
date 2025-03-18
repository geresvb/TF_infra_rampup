output "resource_group_name" {
  description = "Resoruce Group Name:"
  value       = azurerm_resource_group.RG_1.name
}

output "PrivateIPFrontend" {
  description = "Frontend Private IP:"
  value       = azurerm_linux_virtual_machine.FrontendVM.private_ip_address
}

output "PrivateIPBackend" {
  description = "Backend Private IP:"
  value       = azurerm_linux_virtual_machine.BackendVM.private_ip_address
}

output "PrivateIPManagement" {
  description = "Management Private IP:"
  value       = azurerm_linux_virtual_machine.ManagementVM.private_ip_address
}

output "PrivateIPDB" {
  description = "Database Private IP:"
  value       = azurerm_linux_virtual_machine.dbvm.private_ip_address
}

output "LoadBalancerIP" {
  description = "Load Balancer Public Ip"
  value       = azurerm_public_ip.lb_public_ip.ip_address
}

output "PublicIPManagement" {
  description = "Management Public Ip"
  value       = azurerm_linux_virtual_machine.ManagementVM.public_ip_address
}