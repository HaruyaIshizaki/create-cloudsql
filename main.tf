terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.13.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_sql_database_instance" "master" {
  name             = "example-psql-instance"
  region           = "asia-northeast1"
  database_version = "POSTGRES_14"
  root_password    = var.psql_root_password
  settings {
    tier = "db-custom-1-3840"
    password_validation_policy {
      min_length                  = 6
      reuse_interval              = 2
      complexity                  = "COMPLEXITY_DEFAULT"
      disallow_username_substring = true
      password_change_interval    = "30s"
      enable_password_policy      = true
    }
  }
}

