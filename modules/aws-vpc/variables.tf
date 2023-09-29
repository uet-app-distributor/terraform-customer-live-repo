variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR range for customer VPC"
}

variable "vpc_tags" {
  type        = map(string)
  default     = {}
  description = "Tags for customer VPC"
}

