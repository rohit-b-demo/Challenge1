variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}

# Azure Provider source and version being used
terraform {
  backend "local" {
    path = "state/terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.10.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}