variable "projectname" {
  type = string
}
variable "location" {
  type = string
  default = "France Central"
}
variable "resource_group_name" {
  type = string
}
variable "app_service_plan" {
  type = object({
    sku_name = string
    os_type = string
  })
  default = {
    sku_name = "Y1" # Consumption plan
    os_type = "Linux"
  }
}
variable "app_config" {
  type = object({
    function_app_name = string
    python_version = string
  })
}
variable "storage_account_name" {
  type = string
}