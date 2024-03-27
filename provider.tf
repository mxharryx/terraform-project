terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "5518087e-908d-4cb5-ac6a-d09d9eef4fb6"
    tenant_id = "63915053-ae31-426d-ba18-7dea40ef3b91"
    client_id = "10f0578c-1dad-4690-907d-5960e88350c6"
    client_secret = "nBD8Q~FIIDdBEz4rZRW2VSL_N7CzIYRfyN5Z2a.S"
  features {}
}

