# iat-terraform-learning

## Getting Started on a fresh Virtual Machine

- Install Choco
    - Open PowerShell as Admin
    - `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`
- Install Terraform
    - Open PowerShell
    - `choco install terraform`
- Install Azure CLI
    - Open Powershell
    - `winget install -e --id Microsoft.AzureCLI`
- Setup Azure with Terraform
    - https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build
    - Open Powershell
    - `az login`
    - `az account set --subscription "<ID from previous command here>"`

## Module 1

1. Create Virtual Machine
    - Subscription: AZ-900T00-A CSR 1
    - Resource Group: myRGKV-lod33066980
    - Name: my-VM-33066980
    - Image: Ubuntu Server 20.04 LTS - Gen2
    - Size: B1ls
    - AuthType: Password
    - Username: azureuser
    - Password: aSrJ2e!0D!aSrJ2e!0D!
    - Public Inbound Ports: None
