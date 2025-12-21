output "aws_eks_cluster_ids" {
  description = "List of AKS Cluster IDs"
  value       = { for k, v in azurerm_kubernetes_cluster.aks : k => v.id }
}