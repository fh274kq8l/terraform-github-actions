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
    resource_group_name  = "rg-satfstate19032023-dev-001"
    storage_account_name = "satfstate19032023"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }  
}

provider "azurerm" {
  features {}
}
