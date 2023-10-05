# Create storage account for functions to store
resource "azurerm_storage_account" "functionapp-sa" {
  name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}

# Create app service plan
resource "azurerm_service_plan" "app_service_plan" {
  name = join("-", ["asp", var.projectname])
  resource_group_name = var.resource_group_name
  location = var.location
  os_type = var.app_service_plan.os_type
  sku_name = var.app_service_plan.sku_name # Defaults to consumption plan
}

# Create function app
resource "azurerm_linux_function_app" "function_app" {
    location = var.location
    storage_account_name = azurerm_storage_account.functionapp-sa.name
    storage_account_access_key = azurerm_storage_account.functionapp-sa.primary_access_key
    name = var.app_config.function_app_name
    resource_group_name = var.resource_group_name
    service_plan_id = azurerm_service_plan.app_service_plan.id
    site_config {
        application_stack {
            python_version = var.app_config.python_version
        }
        cors {
            support_credentials = var.site_config.cors.support_credentials
            allowed_origins = var.site_config.cors.allowed_origins
        }
    }
    https_only = true # https enforced
    app_settings = {
      "connection_string" = var.app_settings.connection_string
      "partition_key" = var.app_settings.partition_key
      "row_key" = var.app_settings.row_key
      "table_name" = var.app_settings.table_name
    }
}
