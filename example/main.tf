variable "name" {
  default = "terraform_test"
}

data "alicloud_zones" "default" {
  available_resource_creation = "MongoDB"
  enable_details              = true
}

resource "alicloud_vpc" "default" {
  vpc_name   = "terraform_test"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vswitch_name = "terraform_test"
  cidr_block   = "172.16.0.0/16"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}

module "example" {
  source             = "../"
  name               = var.name
  security_ip_list = ["127.0.0.1"]
  vswitch_id         = alicloud_vswitch.default.id
  zone_id  = data.alicloud_zones.default.zones.0.id
}
