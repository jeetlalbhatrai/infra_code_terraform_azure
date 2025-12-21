output "rg_names" {
  value = { for k, v in var.rgs : k => v.name }
}
