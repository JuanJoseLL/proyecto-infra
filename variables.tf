variable "project_id" {
  description = "The GCP project ID to deploy resources into."
  type        = string
  // Example: set in a terraform.tfvars file or via environment variable
}

variable "region" {
  description = "The GCP region for primary resources."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone for the GKE cluster primary node location."
  type        = string
  default     = "us-central1-a"
}

variable "cluster_name" {
  description = "Base name for the GKE cluster."
  type        = string
  default     = "ingesoft-final"
}

variable "gke_node_machine_type" {
  description = "Machine type for GKE nodes."
  type        = string
  default     = "e2-standard-4" // 4 vCPUs
}

variable "gke_initial_node_count" {
  description = "Initial number of nodes for the GKE cluster node pool (if autoscaling disabled)."
  type        = number
  default     = 1
}

variable "gke_min_node_count" {
  description = "Minimum number of nodes for GKE node pool autoscaling."
  type        = number
  default     = 1
}

variable "gke_max_node_count" {
  description = "Maximum number of nodes for GKE node pool autoscaling."
  type        = number
  default     = 3
}

variable "vpc_network_name" {
  description = "The name for the VPC network."
  type        = string
  default     = "ingesoft-vpc"
}

variable "gke_subnetwork_name" {
  description = "The name for the GKE subnetwork."
  type        = string
  default     = "ingesoft-gke-subnet"
}

variable "subnetwork_ip_cidr_range" {
  description = "The IP CIDR range for the GKE subnetwork."
  type        = string
  default     = "10.10.0.0/20"
}