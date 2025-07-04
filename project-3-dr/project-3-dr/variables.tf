variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "project-2-458822"
}

variable "primary_region" {
  description = "Primary GCP region"
  type        = string
  default     = "us-central1"
}

variable "secondary_region" {
  description = "Secondary GCP region"
  type        = string
  default     = "us-east1"
}

variable "bucket_name" {
  description = "Base name for the Cloud Storage buckets"
  type        = string
  default     = "hemanth_dr_bucket"
}

variable "secondary_ip" {
  description = "Primary service public IP"
  type        = string
  default = "34.68.123.45"
}
variable "primary_ip" {
  description = "Primary service public IP"
  type        = string
  default = "35.224.56.78"
}
variable "dns_zone_name" {
  description = "The DNS managed zone name"
  type        = string
  default     = "somen-store-zone"
}

variable "domain_name" {
  description = "Domain name for DNS"
  type        = string
  default     = "somen.store."
}


