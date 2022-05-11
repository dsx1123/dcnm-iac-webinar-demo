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
  default     = "fabric-cylon"
}

variable "leaf" {
  type = list(string)
  default = [
    "93240YC-FX2-L01-S4",
    "93240YC-FX2-L02-S4",
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
