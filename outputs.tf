locals {
  this_mongodb_instance_engine_version = concat(alicloud_mongodb_instance.this.*.engine_version, [""])[0]
  this_db_instance_class               = concat(alicloud_mongodb_instance.this.*.db_instance_class, [""])[0]
  this_db_instance_storage             = concat(alicloud_mongodb_instance.this.*.db_instance_storage, [""])[0]
  this_mongodb_instance_charge_type    = concat(alicloud_mongodb_instance.this.*.instance_charge_type, [""])[0]
  this_db_instance_name                = concat(alicloud_mongodb_instance.this.*.name, [""])[0]
  this_db_instance_zone_id             = concat(alicloud_mongodb_instance.this.*.zone_id, [""])[0]
}
#################
# MongoDB Instance
#################
output "this_mongodb_instance_id" {
  description = "The ID of the MongoDB instance. "
  value       = concat(alicloud_mongodb_instance.this.*.id, [""])[0]
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
  value       = concat(alicloud_mongodb_instance.this.*.period, [""])[0]
}

output "this_mongodb_instance_zone_id" {
  description = "The Zone to launch the MongoDB instance. "
  value       = concat(alicloud_mongodb_instance.this.*.zone_id, [""])[0]
}

output "this_mongodb_instance_vswitch_id" {
  description = "The virtual switch ID to launch MongoDB instances in one VPC. "
  value       = concat(alicloud_mongodb_instance.this.*.vswitch_id, [""])[0]
}

output "this_mongodb_instance_tags" {
  description = "A mapping of tags to assign to the MongoDB instance resource. "
  value       = concat(alicloud_mongodb_instance.this.*.tags, [""])[0]
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
  value       = concat(alicloud_mongodb_instance.this.*.storage_engine, [""])[0]
}

output "this_mongodb_instance_name" {
  description = "The name of MongoDB instance. "
  value       = local.this_db_instance_name
}

output "this_mongodb_instance_security_ip_list" {
  description = "IP whitelist of MongoDB instances. "
  value       = concat(alicloud_mongodb_instance.this.*.security_ip_list, [""])[0]
}

output "this_mongodb_instance_replication_factor" {
  description = "Number of replica set nodes. "
  value       = concat(alicloud_mongodb_instance.this.*.replication_factor, [""])[0]
}

output "this_mongodb_instance_backup_period" {
  description = "The MongoDB instance backup period. "
  value       = concat(alicloud_mongodb_instance.this.*.backup_period, [""])[0]
}

output "this_mongodb_instance_backup_time" {
  description = "The MongoDB instance backup time. "
  value       = concat(alicloud_mongodb_instance.this.*.backup_time, [""])[0]
}