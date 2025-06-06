
terraform {
  backend "gcs" {
    bucket  = "terraform_state_ingesoft"
    prefix  = "gke-infra/prod"  
  }
}