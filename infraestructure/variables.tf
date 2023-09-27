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
  })
  default = {
    cors = {
      support_credentials = false
      allowed_origins     = []
    }
  }
  sensitive = true
}