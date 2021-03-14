variable "fabric" {
  description = "production fabric name"
  type        = string
}

variable "interfaces" {
  description = "inteface group"
  type        = list(any)
  default     = []
}
variable "networks" {
  description = "network of vrf blue"
  type        = map(any)
  default     = {}
}

variable "leaf" {
  description = "leaf switches"
  type        = list(any)
  default     = []
}
