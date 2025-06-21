terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_ID
  region  = var.primary_region
  alias   = "primary"
}

provider "google" {
  project = var.project_ID
  region  = var.secondary_region
  alias   = "secondary"
}

# Primary VPC module deployed with primary provider
module "vpc_primary" {
  source  = "./project-3-dr/vpc/main.tf"
  region  = var.primary_region
  index   = 1

  providers = {
    google = google.primary
  }
}

# Secondary VPC module deployed with secondary provider
module "vpc_secondary" {
  source  ="./project-3-dr/vpc/main.tf"
  region  = var.secondary_region
  index   = 2

  providers = {
    google = google.secondary
  }
}

# Storage module creates buckets in primary and secondary regions using primary provider
module "storage" {
  source           = "./project-3-dr/storage"
  region           = var.primary_region
  bucket_name      = var.bucket_name
  primary_bucket   = "${var.bucket_name}-${var.primary_region}"
  secondary_bucket = "${var.bucket_name}-${var.secondary_region}"

  providers = {
    google = google.primary
  }
}

# DNS module - Create DNS Managed Zone and failover records for your domain
module "DNS" {
  source       = "./project-3-dr/dns"
  primary_ip   = var.primary_ip
  secondary_ip = var.secondary_ip
  domain_name  = var.domain_name

  providers = {
    google = google.primary
  }
}

# Enable Firestore API on your project
resource "google_project_service" "firestore" {
  project = var.project_ID
  service = "firestore.googleapis.com"
}
