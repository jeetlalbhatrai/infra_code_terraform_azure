module "rg" {
  source   = "../../modules/resource_group"
  rgs = var.rgs
}

module "networks" {
  depends_on = [module.rg]
  source     = "../../modules/vnet"
  networks   = var.networks
}

module "pips" {
  depends_on = [module.rg]
  source     = "../../modules/publicip"
  pips       = var.pips
}

module "kv" {
  depends_on = [module.rg]
  source     = "../../modules/key_vault"
  kv         = var.kv
}

module "kv_secret" {
  depends_on = [module.kv]
  source     = "../../modules/key_secret"
  kv_secret  = var.kv_secret

}

module "vms" {
  depends_on = [module.rg, module.pips, module.kv, module.kv_secret]
  source = "../../modules/vm"
  vms = var.vms

}

module "storage" {
  depends_on = [module.rg]
  source     = "../../modules/storage_account"
  storage_accounts = var.storage_accounts
}

module "aks_clusters" {
  depends_on = [module.rg, module.networks]
  source     = "../../modules/aks"
  aks_clusters = var.aks_clusters
}


# module "aks" {
#   source       = "../../modules/aks"
#   cluster_name = "demo-aks-dev"
#   rg_name      = module.rg.rg_names[each.key].name
#   location     = "East US"
#   dns_prefix   = "devaks"
# }
