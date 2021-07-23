# -----------------------------------------------------------------------------
# Manage Versions
# -----------------------------------------------------------------------------
terraform {
  required_version = "= 0.15.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "= 3.67.0"
    }
  }

  backend "gcs" {}
}

# -----------------------------------------------------------------------------
# Prepare Providers
# -----------------------------------------------------------------------------
provider "google" {
  credentials = "${file("../../.credentials/terraform-service-account.json")}"
  project     = var.project_id
  region      = var.region
}

# -----------------------------------------------------------------------------
# Enable APIs
# -----------------------------------------------------------------------------
resource "google_project_service" "text-to-speech" {
  service            = "texttospeech.googleapis.com"
  project            = var.project_id
  disable_on_destroy = true
}
