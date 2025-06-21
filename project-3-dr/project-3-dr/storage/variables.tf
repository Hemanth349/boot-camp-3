variable "region" {
  description = "Region where buckets will be created"
  type        = string
}

variable "bucket_name" {
  description = "Base name for the Cloud Storage buckets"
  type        = string
}

variable "primary_bucket" {
  description = "Name of the primary bucket"
  type        = string
}

variable "secondary_bucket" {
  description = "Name of the secondary bucket"
  type        = string
}

variable "primary_region" {
  description = "Primary region"
  type        = string
}

variable "secondary_region" {
  description = "Secondary region"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

