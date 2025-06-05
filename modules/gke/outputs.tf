output "cluster_name" {
  description = "The name of the GKE cluster."
  value       = google_container_cluster.primary_cluster.name
}

output "cluster_endpoint" {
  description = "The endpoint of the GKE cluster."
  value       = google_container_cluster.primary_cluster.endpoint
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "The CA certificate for the GKE cluster."
  value       = google_container_cluster.primary_cluster.master_auth[0].cluster_ca_certificate
  sensitive   = true
}

output "node_pool_name" {
  description = "The name of the GKE node pool."
  value       = google_container_node_pool.primary_node_pool.name
}

output "workload_identity_pool" {
  description = "The workload identity pool for the cluster."
  value       = "${var.project_id}.svc.id.goog"
}