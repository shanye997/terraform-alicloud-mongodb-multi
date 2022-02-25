output "this_mongodb_instance_name" {
  description = "The name of MongoDB instance. "
  value       = concat(module.example.*.this_mongodb_instance_name, [""])[0]
}
output "this_mongodb_instance_id" {
  description = "The ID of the MongoDB instance. "
  value       = concat(module.example.*.this_mongodb_instance_id, [""])[0]
}