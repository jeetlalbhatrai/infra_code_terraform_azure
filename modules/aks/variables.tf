variable "aks_clusters" {
  description = "A map of AKS cluster configurations"

  type = map(object({
    cluster_name = string
    location     = string
    rg_name      = string
    dns_prefix   = string

    identity = object({
      type                       = string
      user_assigned_identity_ids = optional(list(string))
    })

    default_node_pool = object({
      name       = string
      vm_size    = string
      node_count = number
    })
  }))
  default    = {}
}