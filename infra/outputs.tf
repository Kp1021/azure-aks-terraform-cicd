output "aks_cluster_name" {
  description = "AKS cluster name"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "resource_group" {
  description = "Resource group name"
  value       = azurerm_resource_group.rg.name
}