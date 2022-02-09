provider "openstack" {
  user_name   = var.user_name
  password    = var.user_pass
  tenant_id   = var.tenant_id
  auth_url    = var.api_identity_url
}

resource "openstack_compute_keypair_v2" "key01" {
  name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "openstack_compute_instance_v2" "ubuntu01" {
  name        = var.vm_name
  key_pair    = var.key_name
  image_name  = "vmi-ubuntu-20.04-amd64-20gb"
  flavor_name = "g-512mb"
  security_groups = [
    "default",
    "gncs-ipv4-all",
    "gncs-ipv6-all"
  ]
  user_data = templatefile(var.userdata, { public_key = file(var.public_key_path) })
  metadata = {
    instance_name_tag = "ubuntu"
  }
}
