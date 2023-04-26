resource "google_secret_manager_secret" "secret_1" {
  secret_id = "secret_1"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "secret_1" {
  secret = google_secret_manager_secret.secret_1.id
  secret_data = "First Secret"
  depends_on = [google_secret_manager_secret.secret_1]
}

resource "google_secret_manager_secret_iam_binding" "secret_1" {
  project = google_secret_manager_secret.secret_1.project
  secret_id = google_secret_manager_secret.secret_1.secret_id
  role = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:${google_service_account.service_1.email}"
  ]
}