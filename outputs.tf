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

output "load_balancer_dns_url" {
  value       = azurerm_public_ip.lb_public_ip.fqdn != null ? "http://${azurerm_public_ip.lb_public_ip.fqdn}" : "FQDN not available yet"
  description = "The public DNS URL of the Load Balancer"
}

output "backend_runner_token" {
  value = var.backend_runner_token
  sensitive = false
}

output "frontend_runner_token" {
  value = var.frontend_runner_token
  sensitive = false
}
