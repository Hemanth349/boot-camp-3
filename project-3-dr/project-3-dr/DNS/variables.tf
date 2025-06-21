variable "primary_ip" {
  description = "Primary service public IP"
  type        = string
}

variable "secondary_ip" {
  description = "Secondary service public IP"
  type        = string
}

variable "domain_name" {
  description = "Domain name for DNS"
  type        = string
}
variable "dns_zone_name" {
  description = "The DNS managed zone name"
  type        = string
}

