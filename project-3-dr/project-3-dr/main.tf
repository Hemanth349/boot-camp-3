terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.primary_region
  alias   = "primary"
}

provider "google" {
  project = var.project_id
  region  = var.secondary_region
  alias   = "secondary"
}

module "vpc_primary" {
  source  = "./vpc"
  region  = var.primary_region
  index   = 1
  providers = {
    google = google.primary
  }
}

module "vpc_secondary" {
  source  = "./vpc"
  region  = var.secondary_region
  index   = 2
  providers = {
    google = google.secondary
  }
}

module "storage" {
  source           = "./storage"
  bucket_name      = var.bucket_name
  primary_region   = var.primary_region
  secondary_region = var.secondary_region
  primary_bucket   = "${var.bucket_name}-${var.primary_region}"
  secondary_bucket = "${var.bucket_name}-${var.secondary_region}"
  project_id       = var.project_id       # Add this line
  region           = var.primary_region   # Add this line if module expects a region
  providers = {
    google = google.primary
  }
}


module "DNS" {
  source       = "./DNS"
  primary_ip   = var.primary_ip
  secondary_ip   = var.secondary_ip
  domain_name  = var.domain_name
 dns_zone_name = var.dns_zone_name 
  providers = {
    google = google.primary
  }
}

resource "google_project_service" "firestore" {
  project = var.project_id
  service = "firestore.googleapis.com"
}
