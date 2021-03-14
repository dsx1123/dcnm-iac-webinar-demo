variable "fabric" {
  description = "production fabric name"
  type        = string
}

variable "vrfs" {
  description = "vrf configuration"
  type        = map(any)
  default     = {}
}

variable "leaf" {
  description = "leaf switches"
  type        = list(any)
  default     = []
}
