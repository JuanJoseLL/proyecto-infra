variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region for the VPC resources."
  type        = string
}

variable "network_name" {
  description = "The name for the VPC network."
  type        = string
}

variable "subnetwork_name" {
  description = "The name for the GKE subnetwork."
  type        = string
}

variable "subnetwork_ip_cidr_range" {
  description = "The IP CIDR range for the GKE subnetwork."
  type        = string
}