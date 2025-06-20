terraform {
  backend "gcs" {
    bucket  = "your-terraform-state-bucket"
    prefix  = "dr-setup/terraform/state"
  }
}
