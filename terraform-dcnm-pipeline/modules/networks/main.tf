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

resource "dcnm_network" "networks" {
  for_each     = var.networks
  fabric_name  = var.fabric
  name         = each.value.name
  network_id   = each.value.network_id
  vlan_id      = each.value.vlan_id
  description  = "create from terraform"
  vrf_name     = each.value.vrf_name
  ipv4_gateway = each.value.ipv4_gateway
  ipv6_gateway = each.value.ipv6_gateway

  deploy = true
  dynamic "attachments" {
    for_each = [for l in data.dcnm_inventory.leaf : l.serial_number]
    content {
      serial_number = attachments.value
      attach        = true
      switch_ports  = var.interfaces
    }
  }
}
