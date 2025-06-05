output "vpc_network_name" {
  description = "Name of the VPC network created."
  value       = module.vpc.network_name
}

output "vpc_subnetwork_name" {
  description = "Name of the subnetwork created for GKE."
  value       = module.vpc.subnetwork_name
}

output "gke_cluster_name" {
  description = "The name of the GKE cluster."
  value       = module.gke.cluster_name
}

output "gke_cluster_endpoint" {
  description = "The endpoint of the GKE cluster."
  value       = module.gke.cluster_endpoint
  sensitive   = true
}

output "gke_cluster_ca_certificate" {
  description = "The CA certificate for the GKE cluster."
  value       = module.gke.cluster_ca_certificate
  sensitive   = true
}

output "gke_node_pool_name" {
  description = "The name of the GKE node pool."
  value       = module.gke.node_pool_name
}