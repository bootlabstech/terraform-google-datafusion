data "google_app_engine_default_service_account" "default" {
  project = var.project_id
}

data "google_project" "service_project5" {
  project_id = var.project_id
}

resource "google_data_fusion_instance" "extended_instance" {
  provider   = "google-beta"
  name       = var.name
  description = "My Data Fusion instance"
  project    = var.project_id
  region     = var.region
  type       = var.datafusion_type
  enable_stackdriver_logging     = var.logging_enabled
  enable_stackdriver_monitoring  = var.monitoring_enabled
  private_instance               = var.is_private

  labels = {
    example_key = "example_value"
  }

  network_config {
    network        = var.network
    ip_allocation  = var.ip_allocation
  }

  version = var.datafusion_version

  dataproc_service_account = var.use_user_defined_dataproc_service_account ? var.user_defined_dataproc_service_account : ""

  lifecycle {
    ignore_changes = [
      dataproc_service_account
    ]
  }
}

resource "google_project_iam_binding" "network_binding6" {
  count   = 1
  project = var.project_id
  role    = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:service-${data.google_project.service_project5.number}@gcp-sa-datafusion.iam.gserviceaccount.com",
  ]
}