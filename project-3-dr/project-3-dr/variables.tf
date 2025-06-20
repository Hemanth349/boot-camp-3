variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "primary_region" {
  description = "Primary GCP region"
  default     = "us-central1"
}

variable "secondary_region" {
  description = "Secondary GCP region"
  default     = "us-east1"
}

variable "bucket_name" {
  description = "Base name for the Cloud Storage buckets"
  type        = string
}

variable "primary_ip" {
  description = "Primary service public IP (load balancer or server)"
  type        = string
}

variable "secondary_ip" {
  description = "Secondary service public IP"
  type        = string
}

variable "domain_name" {
  description = "Domain name for DNS"
  default     = "example.com."
}
