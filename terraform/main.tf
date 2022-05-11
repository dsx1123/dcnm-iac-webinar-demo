terraform {
  required_providers {
    dcnm = {
      source  = "CiscoDevNet/dcnm"
      version = "1.2.2"
    }
  }
}
provider "dcnm" {
  username = var.dcnm_username
  password = var.dcnm_password
  url      = "https://172.25.74.47"
  platform = "nd"
}

data "dcnm_inventory" "leaf" {
  for_each    = toset(var.leaf)
  fabric_name = var.fabric
  switch_name = each.value
}

resource "dcnm_vrf" "terraform" {
  fabric_name = var.fabric
  name        = "terraform"
  vlan_name   = "terraform"
  deploy      = true
  dynamic "attachments" {
    for_each = [for l in data.dcnm_inventory.leaf : l.serial_number]
    content {
      serial_number = attachments.value
      attach        = true
    }
  }
}

resource "dcnm_network" "terraform" {
  fabric_name  = var.fabric
  name         = "network_terraform"
  description  = "create from terraform"
  vrf_name     = "terraform"
  ipv4_gateway = "10.10.1.1/24"
  ipv6_gateway = "2021:10:10:1::1/64"

  deploy = true
  dynamic "attachments" {
    for_each = [for l in data.dcnm_inventory.leaf : l.serial_number]
    content {
      serial_number = attachments.value
      attach        = true
      switch_ports  = var.int_grp
    }
  }
  depends_on = [
    dcnm_vrf.terraform
  ]
}
