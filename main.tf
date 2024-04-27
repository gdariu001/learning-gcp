terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
project = "heat-wave"
region = "us-central1"
zone = "us-cnetral1-a"
credentials ="heat-wave-416401-c633d09d3e49.json"
}

resource "google_storage_bucket" "summer-bucket123456" {
  name          = "stay-off-my-way"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}