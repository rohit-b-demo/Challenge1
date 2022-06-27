variable "resource_group_name" {}
variable "resource_group_location" {}
variable "environment" {}
variable "vnetcidr" {}
variable "websubnetcidr" {}
variable "appsubnetcidr" {}
variable "dbsubnetcidr" {}
variable "websubnetname" {}
variable "appsubnetname" {}
variable "dbsubnetname" {}
variable "application_port" {}
variable "admin_user" {}
variable "web_host_name"{}
variable "web_username" {}
variable "app_host_name"{}
variable "app_username" {}
variable "primary_database" {}
variable "primary_database_admin" {}
variable "primary_database_version" {}
variable "admin_password" {
    sensitive = true
}
variable "web_os_password" {
    sensitive = true
}
variable "app_os_password" {
    sensitive = true    
}
variable "primary_database_password" {
    sensitive = true
}
