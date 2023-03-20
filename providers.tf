terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = "rg-satfstate20032023-dev-001"
    storage_account_name = "satfstate20032023"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }  
}

provider "azurerm" {
  features {}
  #use_oidc = true
  subscription_id = data.azurerm_client_config.default.subscription_id
  tenant_id       = data.azurerm_client_config.default.tenant_id  
}

data "azurerm_client_config" "default" {}