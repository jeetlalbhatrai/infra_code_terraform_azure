module "rg" {
  source   = "../../modules/resource_group"
  name     = "donotdelete"
  location = "East US"
}

module "vnet" {
  source         = "../../modules/vnet"
  name           = "demo-vnet-prod"
  rg_name        = module.rg.rg_name
  location       = "East US"
  address_space  = "10.0.0.0/16"
}

module "storage" {
  source   = "../../modules/storage_account"
  name     = "demostorage1234prod"
  rg_name  = module.rg.rg_name
  location = "East US"
}

module "keyvault" {
  source   = "../../modules/key_vault"
  name     = "demo-kv-prod"
  rg_name  = module.rg.rg_name
  location = "East US"
}

module "aks" {
  source       = "../../modules/aks"
  cluster_name = "demo-aks-prod"
  rg_name      = module.rg.rg_name
  location     = "East US"
  dns_prefix   = "prodaks"
}
