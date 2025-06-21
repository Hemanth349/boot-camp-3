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

#  Failover A Record with routing policy
resource "google_dns_record_set" "failover" {
  name         = "app.somen.store."
  type         = "A"
  ttl          = 60
  managed_zone = google_dns_managed_zone.zone.name

  routing_policy {
    primary {
      rrdatas = [var.primary_ip]
    }
    backup {
      rrdatas = [var.secondary_ip]
    }
  }
}
