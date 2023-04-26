resource "google_service_account" "service_1" {
    account_id   = "service-account-1"
    display_name = "service-account-1"
}

resource "google_service_account_key" "service_1" {
  service_account_id = google_service_account.service_1.id
}

resource "local_file" "service_1" {
  content  = jsonencode(google_service_account_key.service_1)
  filename = "${path.module}/service-account.json"
}