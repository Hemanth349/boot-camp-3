terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
# 1. Create a DNS Managed Zone for somen.store
resource "google_dns_managed_zone" "zone" {
  name        = "somen-store-zone"
  dns_name    = "somen.store."
  description = "DNS zone for somen.store"
}


# Point to primary IP (manually update if needed)
resource "google_dns_record_set" "app_record" {
  name         = "app.somen.store."
  type         = "A"
  ttl          = 60
  managed_zone = google_dns_managed_zone.zone.name
  rrdatas      = [var.primary_ip]
}

