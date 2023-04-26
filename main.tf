terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    databricks = {
      source = "databricks/databricks"
    }
  }
}

provider "databricks" {

}

provider "google" {

}
