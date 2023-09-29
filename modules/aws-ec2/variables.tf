variable "subnet_cidr" {
  type        = string
  default     = ""
  description = "Required when subnet_id is defined. Subnet CIDR for customer app instance."
}

variable "subnet_id" {
  type        = string
  default     = ""
  description = "Subnet ID for customer app instance."
}

variable "enabled_public_ip" {
  type        = bool
  default     = true
  description = "Enable/disable auto-assign a public IPv4 on customer app instance."
}
