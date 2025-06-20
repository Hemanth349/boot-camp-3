provider "google"{
    project = var.project_ID
    region = var.primary_region

}
provider "google"{
    project = var.project_ID
    region = var.secondary_region
}
module "vpc_primary"{
    source = "./module/vpc"
    region = var.primary_region
    index = 1
}
module "vpc_secondary"{
    source = "./module/vpc"
    region = var.secondary_region
    index = 2
}
module "storage"{
    source = "./module/storage"
    region = var.primary_region
    bucket_name = var.bucket_name
    primary_bucket = "${var.bucket_name}-${var.primary_region}"
    secondary_bucket = "${var.bucket_name}-${var.secondary_region}"
}
module "DNS"{
    source       = "./modules/dns"
    primary_ip   = var.primary_ip
    secondary_ip = var.secondary_ip
    domain_name  = var.domain_name
}
resource "google_project_service" "firestore" {
  service = "firestore.googleapis.com"
}
