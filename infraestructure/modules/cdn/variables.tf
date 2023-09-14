variable "projectname" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "endpoint" {
  type = object({
    static_site_endpoint = string
  })
}
variable "location" {
  type = string
  default = "global"
}
