terraform-azure-infra/
├── README.md
├── .gitignore
├── azure-pipelines.yml
├── modules/
│   ├── resource_group/
│   │   └── main.tf
│   ├── vnet/
│   │   └── main.tf
│   ├── storage_account/
│   │   └── main.tf
│   ├── key_vault/
│   │   └── main.tf
│   └── aks/
│       └── main.tf
└── environments/
    ├── dev/
    │   └── main.tf
    └── prod/
        └── main.tf



main → protected branch  
feature/* → short-lived branches  
PR → auto TF validate + security scan  
Merge only via PR with approvals  
