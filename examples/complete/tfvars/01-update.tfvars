name                = "update-tf-mongodb-name"
db_instance_class   = "dds.mongo.standard"
db_instance_storage = 30
period              = 2
security_ip_list    = ["10.23.12.24"]
account_password    = "YourPassword123!update"
backup_period       = ["Tuesday"]
backup_time         = "00:00Z-01:00Z"
tags = {
  Name = "UpdateMongodb"
}