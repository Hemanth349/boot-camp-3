resource "google_storage_bucket" "bucket" {
  name     = "${var.bucket_name}-${var.region}"
  location = var.region
  versioning {
    enabled = true
  }
}

resource "google_storage_transfer_job" "replication" {
  name = "replication-job"

  transfer_spec {
    gcs_data_source {
      bucket_name = var.primary_bucket
    }
    gcs_data_sink {
      bucket_name = var.secondary_bucket
    }
  }

  schedule {
    schedule_start_date {
      year  = 2025
      month = 6
      day   = 20
    }
    start_time_of_day {
      hours = 1
    }
  }

  status = "ENABLED"
}
