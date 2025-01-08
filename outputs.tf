output "network_id" {
  description = "The ID of the VPC network"
  value       = google_compute_network.main.id
}

output "network_name" {
  description = "The name of the VPC network"
  value       = google_compute_network.main.name
}

output "network_self_link" {
  description = "The self-link of the VPC network"
  value       = google_compute_network.main.self_link
}

output "routing_mode" {
  description = "The routing mode of the VPC network"
  value       = google_compute_network.main.routing_mode
}

output "gateway_ip" {
  description = "The gateway IP address of the VPC network"
  value       = google_compute_network.main.gateway_ipv4
}