locals {
  custom_domain = "www.isaacvergara.com"
  endpoint_name = "isaacvergara-static-website"
}
# CDN Profile
resource "azurerm_cdn_profile" "resume" {
    name = join("-", ["cdn", var.projectname])
    location = var.location
    resource_group_name = var.resource_group_name
    sku = "Standard_Microsoft"
}
resource "azurerm_cdn_endpoint" "resume_endpoint" {
  name = "static-website"
  profile_name = azurerm_cdn_profile.resume.name
  location = var.location
  resource_group_name = var.resource_group_name
  is_http_allowed = true
  is_https_allowed = true
  origin {
    name = "static-website-origin"
    host_name = var.endpoint.static_site_endpoint
  }
  origin_host_header = var.endpoint.static_site_endpoint
  delivery_rule {
    name = "EnforceHTTPS"
    order = 1
    request_scheme_condition {
      match_values = [
        "HTTP"
      ]
      negate_condition = false
      operator = "Equal"
    }
    url_redirect_action {
      protocol = "Https"
      redirect_type = "Found"
    }
  }
}
resource "azurerm_cdn_endpoint_custom_domain" "resume" {
    name = local.endpoint_name
    cdn_endpoint_id = azurerm_cdn_endpoint.resume_endpoint.id
    host_name = local.custom_domain
    cdn_managed_https {
      certificate_type = "Dedicated"
      protocol_type = "ServerNameIndication"
    }
}