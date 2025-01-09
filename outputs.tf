output "id" {
  description = "VPC 네트워크의 고유 ID"
  value       = google_compute_network.network.id
}

output "name" {
  description = "VPC 네트워크의 이름"
  value       = google_compute_network.network.name
}

output "self_link" {
  description = "VPC 네트워크의 self-link (고유 URI)"
  value       = google_compute_network.network.self_link
}

output "routing_mode" {
  description = "VPC 네트워크의 라우팅 모드 (REGIONAL 또는 GLOBAL)"
  value       = google_compute_network.network.routing_mode
}

output "gateway_ipv4" {
  description = "VPC 네트워크의 기본 게이트웨이 IP 주소"
  value       = google_compute_network.network.gateway_ipv4
}

output "project" {
  description = "VPC 네트워크가 속한 GCP 프로젝트 ID"
  value       = google_compute_network.network.project
}

output "auto_create_subnetworks" {
  description = "VPC 네트워크가 자동 서브네트워크 모드인지 여부"
  value       = google_compute_network.network.auto_create_subnetworks
}

output "mtu" {
  description = "VPC 네트워크의 최대 전송 단위 (MTU)"
  value       = google_compute_network.network.mtu
}

output "enable_ula_internal_ipv6" {
  description = "VPC 네트워크에서 내부 ULA IPv6 활성화 여부"
  value       = google_compute_network.network.enable_ula_internal_ipv6
}
