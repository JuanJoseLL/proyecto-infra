output "network_name" {
  description = "The name of the created VPC network."
  value       = google_compute_network.vpc_network.name
}

output "network_self_link" {
  description = "The self-link of the created VPC network."
  value       = google_compute_network.vpc_network.self_link
}

output "subnetwork_name" {
  description = "The name of the created subnetwork."
  value       = google_compute_subnetwork.gke_subnetwork.name
}

output "subnetwork_self_link" {
  description = "The self-link of the created subnetwork."
  value       = google_compute_subnetwork.gke_subnetwork.self_link
}