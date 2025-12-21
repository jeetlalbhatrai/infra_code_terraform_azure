resource "azurerm_kubernetes_cluster" "aks" {
  for_each = var.aks_clusters
  name                = each.value.cluster_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = each.value.default_node_pool.name
    vm_size    = each.value.default_node_pool.vm_size
    node_count = each.value.default_node_pool.node_count
  }

  dynamic "identity" {
  for_each = [each.value.identity]

  content {
    type         = identity.value.type
    identity_ids = lookup(identity.value, "user_assigned_identity_ids", null)
  }
}
}
