terraform {
  required_providers {
    dcnm = {
      source  = "CiscoDevNet/dcnm"
      version = "0.0.5"
    }
  }
}

data "dcnm_inventory" "leaf" {
  for_each    = toset(var.leaf)
  fabric_name = var.fabric
  switch_name = each.value
}

resource "dcnm_vrf" "vrfs" {
  for_each    = var.vrfs
  fabric_name = var.fabric
  segment_id  = each.value.segment_id
  name        = each.value.name
  vlan_id     = each.value.vlan_id
  description = "vrf created from terraform"
  deploy      = true
  dynamic "attachments" {
    for_each = [for l in data.dcnm_inventory.leaf : l.serial_number]
    content {
      serial_number = attachments.value
      attach        = true
    }
  }
}
