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

# CDN
module "static_site" {
  source = "./modules/cdn"

  projectname         = var.projectname
  resource_group_name = azurerm_resource_group.rg-azurecloudresume.name
  endpoint = {
    static_site_endpoint = azurerm_storage_account.sa-azurecloudresume.primary_web_host
  }
}

# Cosmos DB
module "cosmos_db" {
  source = "./modules/cosmodb"

  resource_group_name = azurerm_resource_group.rg-azurecloudresume.name
  location            = var.location
  cosmosdb_name       = join("-", [var.projectname, "cosmodb"])
}

# App Service Storage account name
resource "random_string" "sa-app-service-name" {
  length  = 24
  special = false
  upper   = false
}

# App Service
module "function_app" {
  source = "./modules/function-app"

  resource_group_name = azurerm_resource_group.rg-azurecloudresume.name
  location            = var.location
  projectname         = var.projectname
  app_service_plan = {
    os_type  = "Linux"
    sku_name = "Y1"
  }
  app_config = {
    function_app_name = join("-", ["fapp", "linux", var.projectname])
    python_version    = "3.10"
  }
  storage_account_name = random_string.sa-app-service-name.result
  app_settings = {
    connection_string = var.app_settings.connection_string
    row_key           = var.app_settings.row_key
    partition_key     = var.app_settings.partition_key
    table_name        = var.app_settings.table_name
  }
  site_config = {
    cors = {
      allowed_origins     = var.site_config.cors.allowed_origins
      support_credentials = false
    }
    application_insights_connection_string = var.site_config.application_insights_connection_string
    application_insights_key               = var.site_config.application_insights_key
  }
  sticky_settings = var.sticky_settings
}

