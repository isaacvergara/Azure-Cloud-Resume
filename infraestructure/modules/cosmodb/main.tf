# Create cosmo db with Table API
resource "azurerm_cosmosdb_account" "cosmodb-account" {
    name = var.cosmosdb_name
    location = var.location
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
        location = "West US"
        failover_priority = 0
    }
    # Continuous backup
    backup {
      type = "Continuous"
    }
    consistency_policy {
      consistency_level = "BoundedStaleness"
    }
}