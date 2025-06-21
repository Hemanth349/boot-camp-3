variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "project-2-458822"
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
  default     = "my-dr-bucket"
}

variable "primary_ip" {
  description = "Primary service public IP"
  type        = string
  default     = "34.123.45.67"
}

variable "secondary_ip" {
  description = "Secondary service public IP"
  type        = string
  default     = "35.234.56.78"
}

variable "domain_name" {
  description = "Domain name for DNS"
  default     = "."
}
