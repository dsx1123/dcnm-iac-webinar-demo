variable "dcnm_username" {
  description = "dcnm username"
  type        = string
  default     = "admin"
}

variable "dcnm_password" {
  description = "dcnm password"
  type        = string
  sensitive   = true
}

variable "dcnm_url" {
  description = "dcnm url"
  type        = string
  default     = "https://172.25.74.53"
}

variable "fabric" {
  description = "fabric name"
  type        = string
}

variable "leaf" {
  description = "leaf switches"
  type        = list(string)
}

variable "interfaces" {
  description = "inteface group"
  type        = list(string)
}

variable "vrfs" {
  description = "VRFs configuration"
  type        = map(any)
  default = {
    vrf_blue = {
      name       = "BLUE"
      segment_id = 50010
      vlan_id    = 2010
    },
    vrf_red = {
      name       = "RED"
      segment_id = 50011
      vlan_id    = 2011
    }
  }
}

variable "networks" {
  description = "NETWORKS configuration"
  type        = map(any)
  default = {
    network_web = {
      name         = "network_web"
      network_id   = 30010
      vlan_id      = 2310
      vrf_name     = "BLUE"
      ipv4_gateway = "10.10.1.1/24"
      ipv6_gateway = "2021:10:10:1::1/64"
    },
    network_app = {
      name         = "network_app"
      network_id   = 30011
      vlan_id      = 2311
      vrf_name     = "BLUE"
      ipv4_gateway = "10.10.2.1/24"
      ipv6_gateway = "2021:10:10:2::1/64"
    },
    network_db = {
      name         = "network_db"
      network_id   = 30012
      vlan_id      = 2312
      vrf_name     = "BLUE"
      ipv4_gateway = "10.10.3.1/24"
      ipv6_gateway = "2021:10:10:3::1/64"
    }
  }
}
