variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "cluster_name" {
  description = "The name for the GKE cluster."
  type        = string
}

variable "location" {
  description = "The location (region or zone) for the GKE cluster."
  type        = string
}

variable "network_self_link" {
  description = "The self-link of the VPC network to deploy GKE into."
  type        = string
}

variable "subnetwork_self_link" {
  description = "The self-link of the subnetwork to deploy GKE into."
  type        = string
}

variable "node_machine_type" {
  description = "Machine type for GKE nodes."
  type        = string
}

variable "initial_node_count" {
  description = "Initial number of nodes for the node pool."
  type        = number
}

variable "min_node_count" {
  description = "Minimum number of nodes for GKE node pool autoscaling."
  type        = number
}

variable "max_node_count" {
  description = "Maximum number of nodes for GKE node pool autoscaling."
  type        = number
}