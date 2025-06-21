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
