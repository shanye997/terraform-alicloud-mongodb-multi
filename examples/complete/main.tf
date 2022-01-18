data "alicloud_mongodb_zones" "default" {
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_name           = var.name
  vpc_cidr           = "172.16.0.0/16"
  vswitch_name       = var.name
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_mongodb_zones.default.zones.0.id]
}

module "example" {
  source = "../.."

  create_resources_size = "1"

  engine_version       = "4.0"
  name                 = var.name
  instance_charge_type = var.instance_charge_type
  db_instance_class    = var.db_instance_class
  db_instance_storage  = var.db_instance_storage
  period               = var.period
  security_ip_list     = var.security_ip_list
  replication_factor   = var.replication_factor
  storage_engine       = "WiredTiger"
  vswitch_id           = module.vpc.this_vswitch_ids[0]
  zone_id              = data.alicloud_mongodb_zones.default.zones.0.id
  account_password     = var.account_password
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  tags                 = var.tags
}