terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

  resource "google_storage_bucket" "primary" {
  name     = "${var.bucket_name}-${var.primary_region}"
  location = var.primary_region
  project  = var.project_id
}

resource "google_storage_bucket" "secondary" {
  name     = "${var.bucket_name}-${var.secondary_region}"
  location = var.secondary_region
  project  = var.project_id
}

resource "google_storage_transfer_job" "replication" {
  description = "Replicate objects from primary to secondary bucket"

  transfer_spec {
    gcs_data_source {
      bucket_name = google_storage_bucket.primary.name
    }

    gcs_data_sink {
      bucket_name = google_storage_bucket.secondary.name
    }

    transfer_options {
      delete_objects_unique_in_sink              = false
      overwrite_objects_already_existing_in_sink = true
    }
  }

  schedule {
    schedule_start_date {
      year  = 2025
      month = 6
      day   = 21
    }

    start_time_of_day {
      hours   = 1
      minutes = 0
      seconds = 0
      nanos   = 0
    }
  }

  status  = "ENABLED"
  project = var.project_id
}
