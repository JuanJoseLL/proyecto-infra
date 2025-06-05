module "vpc" {
  source = "./modules/vpc"

  project_id             = var.project_id
  region                 = var.region
  network_name           = var.vpc_network_name
  subnetwork_name        = var.gke_subnetwork_name
  subnetwork_ip_cidr_range = var.subnetwork_ip_cidr_range
}

module "gke" {
  source = "./modules/gke"

  project_id            = var.project_id
  cluster_name          = var.cluster_name
  location              = var.zone // Or var.region for regional clusters
  network_self_link     = module.vpc.network_self_link
  subnetwork_self_link  = module.vpc.subnetwork_self_link
  node_machine_type     = var.gke_node_machine_type
  initial_node_count    = var.gke_initial_node_count
  min_node_count        = var.gke_min_node_count
  max_node_count        = var.gke_max_node_count
}