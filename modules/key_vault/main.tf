resource "azurerm_key_vault" "kv" {
  name                        = var.name
  resource_group_name         = var.rg_name
  location                    = var.location
  tenant_id                   = "00000000-0000-0000-0000-000000000000"
  sku_name                    = "standard"
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7
}

