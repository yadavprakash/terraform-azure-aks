output "name" {
  value       = join("", azurerm_kubernetes_cluster.aks[*].name)
  description = "Specifies the name of the AKS cluster."
}

output "id" {
  value       = join("", azurerm_kubernetes_cluster.aks[*].id)
  description = "Specifies the resource id of the AKS cluster."
}

output "kube_config_raw" {
  value       = join("", azurerm_kubernetes_cluster.aks[*].kube_config_raw)
  description = "Contains the Kubernetes config to be used by kubectl and other compatible tools."
}

output "aks_system_identity_principal_id" {
  value       = azurerm_kubernetes_cluster.aks[0].identity[0].principal_id
  description = "Content aks system identity's object id"
}

output "node_resource_group" {
  value       = join("", azurerm_kubernetes_cluster.aks[*].node_resource_group)
  description = "Specifies the resource id of the auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
}

output "host" {
  value       = join("", [for instance in azurerm_kubernetes_cluster.aks : instance.kube_config[0].host])
  description = "The Kubernetes API server host for the AKS cluster."
}

output "client_certificate" {
  value       = join("", [for instance in azurerm_kubernetes_cluster.aks : instance.kube_config[0].client_certificate])
  description = "The client certificate for authenticating to the AKS cluster."
}

output "client_key" {
  value       = join("", [for instance in azurerm_kubernetes_cluster.aks : instance.kube_config[0].client_key])
  description = "The client private key for authenticating to the AKS cluster."
}

output "cluster_ca_certificate" {
  value       = join("", [for instance in azurerm_kubernetes_cluster.aks : instance.kube_config[0].cluster_ca_certificate])
  description = "The certificate authority certificate for the AKS cluster."
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.aks[*].kube_config
  description = "The full kubeconfig content for the AKS cluster. It includes information about the cluster, user, and context."
}
