module "resourcegroup" {
  source = "./modules/resourcegroup"
  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
  tags = {
    environment = var.environment
  }
}

module "networking" {
  source         = "./modules/networking"
  resource_group_location = module.resourcegroup.location_id
  resource_group_name = module.resourcegroup.name
  vnetcidr       = var.vnetcidr
  websubnetcidr  = var.websubnetcidr
  appsubnetcidr  = var.appsubnetcidr
  dbsubnetcidr   = var.dbsubnetcidr
  websubnetname  = var.websubnetname
  appsubnetname  = var.appsubnetname
  dbsubnetname   = var.dbsubnetname
}

module "vmscaleset" {
  source         = "./modules/vmscaleset"
  resource_group_location = module.resourcegroup.location_id
  resource_group_name = module.resourcegroup.name
  application_port       = var.application_port
  admin_user  = var.admin_user
  admin_password  = var.admin_password
  websubnetid = "${module.networking.websubnet_id}"
}

module "compute" {
  source         = "./modules/compute"
  resource_group_location = module.resourcegroup.location_id
  resource_group_name = module.resourcegroup.name
  app_subnet_id = "${module.networking.appsubnet_id}"
  app_host_name = var.app_host_name
  app_username = var.app_username
  app_os_password = var.app_os_password
}

module "database" {
  source = "./modules/database"
  resource_group_location = module.resourcegroup.location_id
  resource_group_name = module.resourcegroup.name
  primary_database = var.primary_database
  primary_database_version = var.primary_database_version
  primary_database_admin = var.primary_database_admin
  primary_database_password = var.primary_database_password
  db_subnet_id = "${module.networking.dbsubnet_id}"
}
