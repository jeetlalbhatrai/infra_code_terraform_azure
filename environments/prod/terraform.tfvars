###create rg in prod environment
rgs = {
  "rg-prod-001" = {
    name     = "donotdelete"
    location = "East US"
    tags = {
      environment = "prod"
      project     = "project-name"
    }
  }
  # "rg-prod-002" = {
  #   name       = "rg-prod-002"
  #   location   = "West US"
  #   managed_by = "team-a"
  #   tags       = {
  #     environment = "prod"
  #     project     = "project-name"
  #   }
  # }
}

###create public ip in prod environment
pips = {
  "pip-prod-001" = {
    pip_name            = "prod-pip-001"
    resource_group_name = "donotdelete"
    location            = "East US"
    allocation_method   = "Static"
    tags = {
      environment = "prod"
      project     = "project-name"
    }
  }
}


###create key vault in prod environment
kv = {
  kv1 = {
    kv_name             = "demo-kv"
    location            = "eastus"
    resource_group_name = "donotdelete"
    sku_name            = "standard"

    access_policy = [
      {
        key_permissions     = ["Get"]
        secret_permissions  = ["Get", "List", "Set", "Delete"]
        storage_permissions = ["Get"]
      },
      {
        key_permissions     = ["Get", "List"]
        secret_permissions  = ["Get"]
        storage_permissions = ["Get"]
      }
    ]
  }
}

###create key vault secret in prod environment
kv_secret = {
  secret1 = {
    kv_secret_name      = "demo-kv-password"
    secret_value        = "Passw0rd123!"
    kv_name             = "demo-kv"
    resource_group_name = "donotdelete"
  }
  secret2 = {
    kv_secret_name      = "demo-kv-username"
    secret_value        = "admindb"
    kv_name             = "demo-kv"
    resource_group_name = "donotdelete"
  }
}

#create virtual machines in prod environment
vms = {
  vm1 = {

    nic_name = "nic-frontend"
    ip_configuration = [
      {
        ip_name                       = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    ]
    subnet_name         = "frontend-subnet"
    vnet_name           = "vnet-prod"
    kv_name             = "vv-key-vault"
    username            = "demo-kv-username"
    password            = "demo-kv-password"
    pip_name            = "prod-pip-001"
    nic_name            = "nic-frontend"
    location            = "East US"
    resource_group_name = "donotdelete"
    # admin_username                  = "prodopsadmin"
    # admin_password                  = "admin@12345"
    ip_name                       = "frontend-ip"
    private_ip_address_allocation = "Dynamic"
    vm_name                       = "frontend-vm"
    size                          = "Standard_D2s_v3"
    os_disk = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]

    source_image_reference = [{
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }]
  }
}

###create virtual networks in prod environment
networks = {
  "vnet1" = {
    vnet_name           = "vnet-prod"
    location            = "East US"
    resource_group_name = "donotdelete"
    address_space       = ["10.0.0.0/16"]
    subnet = [
      {
        subnet_name      = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      ,
      {
        subnet_name      = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

###create storage accounts in prod environment
storage_accounts = {
  "stprod001" = {
    name                     = "stprod001storage"
    rg_name                  = "donotdelete"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "prod"
      project     = "project-name"
    }
  }
}

###create aks clusters in prod environment
# aks_clusters = {
#   "aks-prod-001" = {                   
#     cluster_name        = "aks-prod-001"
#     rg_name             = "donotdelete"
#     location            = "East US"
#     dns_prefix          = "prodaks"
#     kubernetes_version  = "1.24.6"
#     node_count          = 1
#     node_vm_size        = "Standard_DS2_v2"
#     tags = {
#       environment = "prod"
#       project     = "project-name"
#     }
#   }
# }

aks_clusters = {
  prod = {
    cluster_name = "prod-aks-test"
    location     = "East US"
    rg_name      = "donotdelete"
    dns_prefix   = "prodaks"

    identity = {
      type = "SystemAssigned"
    }

    default_node_pool = {
      name       = "system"
      vm_size    = "Standard_DS2_v2"
      node_count = 1
    }
  }
}

