resource "google_firestore_document" "firestore_1" {
  project     = "marcos-teste-aubay"
  collection  = "dummys"
  document_id = "dummies"
  fields = jsonencode({
    nome = {
        stringValue = "Marcos"
    }
    idade = {
        integerValue = tonumber(30)
    }
    isOn = {
        booleanValue = tobool(true)
    }
  })
}