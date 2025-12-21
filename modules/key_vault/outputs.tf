output "keyvault_uri" {
  value = { for kv_name, kv in azurerm_key_vault.kv : kv_name => kv.vault_uri }
}