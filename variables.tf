variable "user_name" {
}
variable "user_pass" {
}
variable "tenant_id" {
}
variable "api_identity_url" {
}
variable "public_key_path" {
}
variable "key_name" {
  default = "conoha-key01"
  description = "Key Name"
}
variable "vm_name" {
  default = "conoha-ubuntu01"
  description = "Vm Name"
}
variable "userdata" {
  default = "./config/ubuntu_userdata.txt"
  description = "Cloudinit userdata file name"
}
