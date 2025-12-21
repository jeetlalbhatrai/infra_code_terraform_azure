variable "kv" {
  type = map(object({
    kv_name                     = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = optional(bool)
    soft_delete_retention_days  = optional(number)
    purge_protection_enabled    = optional(bool)
    sku_name                    = string
    access_policy = optional(list(object({
      # tenant_id           = optional(string)
      # object_id           = optional(string)
      key_permissions     = optional(list(string))
      secret_permissions  = optional(list(string))
      storage_permissions = optional(list(string))
    })))
  }))
}