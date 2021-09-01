output "this_ecs_name" {
  value = module.example.*.this_mongodb_instance_name
}
output "this_mongodb_instance_id" {
  description = "The ID of the MongoDB instance. "
  value       = module.example.*.this_mongodb_instance_id
}