output "primary_bucket_name" {
  value = "${var.bucket_name}-${var.primary_region}"
}

output "secondary_bucket_name" {
  value = "${var.bucket_name}-${var.secondary_region}"
}

output "dns_zone_name" {
  value = "dr-zone"
}

output "vpc_primary" {
  value = module.vpc_primary.vpc_name
}

output "vpc_secondary" {
  value = module.vpc_secondary.vpc_name
}
