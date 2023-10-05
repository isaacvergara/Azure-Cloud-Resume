variable "projectname" {
  type = string
}
variable "location" {
  type    = string
  default = "France Central"
}
variable "app_settings" {
  type = object({
    connection_string = string
    table_name        = string
    row_key           = string
    partition_key     = string
  })
  sensitive = true
}
variable "site_config" {
  type = object({
    cors = object({
      allowed_origins     = list(string)
      support_credentials = bool
    })
    application_insights_connection_string = string
    application_insights_key               = string
  })
  default = {
    cors = {
      support_credentials = false
      allowed_origins     = []
    }
    application_insights_connection_string = ""
    application_insights_key               = ""
  }
  sensitive = true
}
variable "sticky_settings" {
  type = object({
    app_setting_names       = list(string)
    connection_string_names = list(string)
  })
  default = {
    app_setting_names       = []
    connection_string_names = []
  }
}