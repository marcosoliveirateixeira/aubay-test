resource "google_composer_environment" "composer_1" {
    labels  = {
        "costcenter" = "aubay"
    }
    name    = "composer-1"
    project = "marcos-teste-aubay"
    region  = "us-east1"
    config {
        node_count = 3

        database_config {
            machine_type = "db-n1-standard-2"
        }

        maintenance_window {
            end_time   = "1970-01-01T04:00:00Z"
            recurrence = "FREQ=WEEKLY;BYDAY=FR,SA,SU"
            start_time = "1970-01-01T00:00:00Z"
        }

        node_config {
            disk_size_gb         = 30
            enable_ip_masq_agent = false

            machine_type         = "projects/marcos-teste-aubay/zones/us-east1-b/machineTypes/n1-standard-1"
            network              = "projects/marcos-teste-aubay/global/networks/default"
            oauth_scopes         = [
                "https://www.googleapis.com/auth/cloud-platform",
            ]
            service_account      = "58256926127-compute@developer.gserviceaccount.com"
            tags                 = [
                "costcenter-aubay",
            ]
            zone                 = "projects/marcos-teste-aubay/zones/us-east1-b"
        }

        software_config {
            airflow_config_overrides = {}
            env_variables            = {}
            image_version            = "composer-1.20.11-airflow-2.4.3"
            pypi_packages            = {}
            python_version           = "3"
            scheduler_count          = 1
        }

        web_server_config {
            machine_type = "composer-n1-webserver-2"
        }

        web_server_network_access_control {
            allowed_ip_range {
                description = "Allows access from all IPv4 addresses (default value)"
                value       = "0.0.0.0/0"
            }
            allowed_ip_range {
                description = "Allows access from all IPv6 addresses (default value)"
                value       = "::0/0"
            }
        }
    }

    timeouts {}
}