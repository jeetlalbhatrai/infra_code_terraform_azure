output "storage_id" {
  value = { for k, sa in azurerm_storage_account.sa : k => sa.id }
}