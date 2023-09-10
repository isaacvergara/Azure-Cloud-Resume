resource "azurerm_resource_group" "rg-azurecloudresume" {
  name     = join("-", ["rg", var.projectname])
  location = var.location
}

# Storage account name
resource "random_string" "sa-name" {
  length  = 24
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa-azurecloudresume" {
  name                     = random_string.sa-name.result
  resource_group_name      = azurerm_resource_group.rg-azurecloudresume.name
  location                 = azurerm_resource_group.rg-azurecloudresume.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Static website. $web container wil be created, load site on that container
  static_website {
    index_document = "main.html"
  }

  tags = {
    projectname = var.projectname
    stage       = "Production"
  }
}