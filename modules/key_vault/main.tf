resource "azurerm_key_vault" "kv" {
  for_each = var.kv

  name                = each.value.kv_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  # dynamic access policy
  dynamic "access_policy" {
    for_each = lookup(each.value, "access_policy", [])

    content {
      tenant_id           = data.azurerm_client_config.current.tenant_id
      object_id           = data.azurerm_client_config.current.object_id
      key_permissions     = access_policy.value.key_permissions
      secret_permissions  = access_policy.value.secret_permissions
      storage_permissions = access_policy.value.storage_permissions
    }
  }
}


