terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
resource "google_compute_network" "vpc" {
  name = "vpc-${var.region}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "subnet-${var.region}"
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = "10.${var.index}.0.0/16"
}
