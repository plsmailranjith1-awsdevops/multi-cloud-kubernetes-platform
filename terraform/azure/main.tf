resource "azurerm_resource_group" "main" {
  name     = "rg-multi-cloud-kubernetes"
  location = var.azure_location

  tags = {
    Project = "multi-cloud-kubernetes-platform"
  }
}

resource "azurerm_virtual_network" "main" {
  name                = "vnet-multi-cloud-kubernetes"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.20.0.0/16"]

  tags = {
    Project = "multi-cloud-kubernetes-platform"
  }
}

resource "azurerm_subnet" "aks" {
  name                 = "snet-aks"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.20.1.0/24"]
}
