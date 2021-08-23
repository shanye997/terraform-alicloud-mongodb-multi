data "alicloud_mongodb_instances" "this" {
  ids = var.existing_instance_id != "" ? [var.existing_instance_id] : null
}
locals {
  this_mongodb_instance_engine_version = alicloud_mongodb_instance.this.*.engine_version
  this_db_instance_class               = alicloud_mongodb_instance.this.*.db_instance_class
  this_db_instance_storage             = alicloud_mongodb_instance.this.*.db_instance_storage
  this_mongodb_instance_charge_type    = alicloud_mongodb_instance.this.*.instance_charge_type
  this_db_instance_name                = alicloud_mongodb_instance.this.*.name
  this_db_instance_zone_id             = alicloud_mongodb_instance.this.*.zone_id
}
#################
# MongoDB Instance
#################
output "this_mongodb_instance_id" {
  description = "The ID of the MongoDB instance. "
  value       = alicloud_mongodb_instance.this.*.id
}

output "this_mongodb_instance_engine_version" {
  description = "The engine version of the MongoDB instance. "
  value       = local.this_mongodb_instance_engine_version
}

output "this_mongodb_instance_charge_type" {
  description = "The billing method of the instance. "
  value       = local.this_mongodb_instance_charge_type
}

output "this_mongodb_instance_period" {
  description = "The duration that you will buy MongoDB instance. "
  value       = alicloud_mongodb_instance.this.*.period
}

output "this_mongodb_instance_zone_id" {
  description = "The Zone to launch the MongoDB instance. "
  value       = alicloud_mongodb_instance.this.*.zone_id
}

output "this_mongodb_instance_vswitch_id" {
  description = "The virtual switch ID to launch MongoDB instances in one VPC. "
  value       = alicloud_mongodb_instance.this.*.vswitch_id
}

output "this_mongodb_instance_tags" {
  description = "A mapping of tags to assign to the MongoDB instance resource. "
  value       = alicloud_mongodb_instance.this.*.tags
}

output "this_mongodb_instance_storage" {
  description = "User-defined DB instance storage space. "
  value       = local.this_db_instance_storage
}

output "this_mongodb_instance_class" {
  description = "The class of MongoDB instance"
  value       = local.this_db_instance_class
}

output "this_mongodb_instance_storage_engine" {
  description = "The storage engine used by the MongoDB instance. "
  value       = alicloud_mongodb_instance.this.*.storage_engine
}

output "this_mongodb_instance_name" {
  description = "The name of MongoDB instance. "
  value       = local.this_db_instance_name
}

output "this_mongodb_instance_security_ip_list" {
  description = "IP whitelist of MongoDB instances. "
  value       = alicloud_mongodb_instance.this.*.security_ip_list
}

output "this_mongodb_instance_replication_factor" {
  description = "Number of replica set nodes. "
  value       = alicloud_mongodb_instance.this.*.replication_factor
}

output "this_mongodb_instance_backup_period" {
  description = "The MongoDB instance backup period. "
  value       = alicloud_mongodb_instance.this.*.backup_period
}

output "this_mongodb_instance_backup_time" {
  description = "The MongoDB instance backup time. "
  value       = alicloud_mongodb_instance.this.*.backup_time
}
