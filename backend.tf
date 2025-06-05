
terraform {
  backend "gcs" {
    bucket  = "terraform_state_ingesoft"
  }
}