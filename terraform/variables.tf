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

variable "fabric" {
  description = "fabric name"
  type        = string
  default     = "fabric-demo"
}

variable "leaf" {
  type = list(string)
  default = [
    "93216TC-FX2-A-S1",
    "93216TC-FX2-B-S1",
  ]
}

variable "int_grp" {
  description = "inteface group"
  type        = list(any)
  default = [
    "Ethernet1/4",
    "Ethernet1/5"
  ]
}
