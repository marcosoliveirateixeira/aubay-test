resource "databricks_cluster" "databricks_1" {
  cluster_name = "cluster_1"
  num_workers            = 2
  node_type_id           = "n1-standard-4"
  autoscale               {
    min_workers = 1
    max_workers = 2
  }
  spark_version          = data.databricks_spark_version.latest_lts.id
  ssh_public_keys        = []
  custom_tags = {
    "costcenter" = "aubay"
  }
  autotermination_minutes = 60
  
  gcp_attributes {
    availability = "PREEMPTIBLE_GCP"
  }
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}