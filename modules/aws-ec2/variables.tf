variable subnet_cidr {
  type        = string
  default     = ""
  description = "Required when subnet_id is defined. Subnet CIDR for customer app instance."
}

variable subnet_id {
  type        = string
  default     = ""
  description = "Subnet ID for customer app instance."
}

