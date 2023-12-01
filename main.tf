resource "google_data_fusion_instance" "extended_instance" {
  provider   = "google-beta"
  name = var.name
  description = "My Data Fusion instance"
  project = var.project_id
  region = var.region
  type = var.datafusion_type
  enable_stackdriver_logging = var.logging_enabled
  enable_stackdriver_monitoring = var.monitoring_enabled
  labels = {
    example_key = "example_value"
  }
  private_instance = var.is_private
  network_config {
    network = var.network
    ip_allocation = var.ip_allocation
  }
  version = var.datafusion_version
  # Conditionally set the dataproc_service_account based on user input
  dataproc_service_account = var.use_user_defined_dataproc_service_account ? var.user_defined_dataproc_service_account : data.google_app_engine_default_service_account.default.email
}

data "google_app_engine_default_service_account" "default" {
    project= var.project_id
}
