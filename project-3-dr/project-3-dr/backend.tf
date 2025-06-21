terraform {
  backend "gcs" {
    bucket  = "hemanth_tf_bucket"
    prefix  = "dr-setup/terraform/state"
  }
}
