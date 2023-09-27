# Create cosmo db with Table API
resource "azurerm_cosmosdb_account" "cosmodb-account" {
    name = var.cosmosdb_name
    location = "West Europe"
    resource_group_name = var.resource_group_name
    offer_type = "Standard"
    kind = "GlobalDocumentDB"
    capabilities {
      name = "EnableTable"
    }
    capabilities {
      name = "EnableServerless"
    }
    geo_location {
        location = var.location
        failover_priority = 0
    }
    # Continuous backup
    backup {
      type = "Periodic"
      interval_in_minutes = 1440
      retention_in_hours = 8
      storage_redundancy = "Local"
    }
    consistency_policy {
      consistency_level = "BoundedStaleness"
    }
}