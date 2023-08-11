# iat-terraform-learning

## Getting Started on a fresh Virtual Machine

- Install Choco
    - Open PowerShell as Admin
    - `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`
- Install Git
    - Open PowerShell
    - `choco install git`
- Install Terraform
    - Open PowerShell
    - `choco install terraform`
- Install Azure CLI (Can take fuckin 30 mins?)
    - Open Powershell
    - `winget install -e --id Microsoft.AzureCLI`
- Setup Azure with Terraform 
    - [Azure Getting Started](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build)
    - Open Powershell
    - `az login`
    - `az account set --subscription "<ID from previous command here>"`
- Import Resource Group (May be needed if the resource group already exists)
    - [Importing Resource Group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group.html)
    - `terraform import azurerm_resource_group.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/group1`


## How to use Terraform Variables

`terraform apply -var='password=password1' -var='resource_group_name=my-resource-group' -var='resource_group_location=eastus2`

`terraform apply -var-file="testing.tfvars`

where tfvars files look like 

```tfvars
password = "password1"
resource_group_name = "my-resource-group"
resource_group_location = "eastus2"
```

## Terraform Workspaces

- Seperate instances of state data


## Week 1

1. Create Virtual Machine
    - Subscription: AZ-900T00-A CSR 1
    - Resource Group: Get from Lab
    - Name: my-VM-33066980
    - Image: Ubuntu Server 20.04 LTS - Gen2
    - Size: B1ls
    - AuthType: Password
    - Username: azureuser
    - Password: Get from Lab
    - Public Inbound Ports: None

## Week 2

[Lab Link](https://learn.microsoft.com/en-us/training/modules/configure-storage-security/8-simulation-storage?ns-enrollment-type=learningpath&ns-enrollment-id=learn.az-104-manage-storage)

1. Create Infrastructure Environment?
    - [Use Lab Template](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator/blob/master/Allfiles/Labs/07/az104-07-vm-template.json)
        - Windows Server 2019 Datacenter on Standard_D2s_v3
        - Has a Network Security Group for Primary NIC
            - Default Allow RDP (TCP 3389 Inbound)
        - Given a dynamic public IP adresss
2. Create and configure Azure storage account
3. Manage blob storage
4. Manage authentication and authorization for Azure storage
5. Create and configure an Azure File share
6. Manage network access for Azure Storage
