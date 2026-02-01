variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "devops-aks-rg"
}

variable "aks_name" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "devops-aks-demo"
}