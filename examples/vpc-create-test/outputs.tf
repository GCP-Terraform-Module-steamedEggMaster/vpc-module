output "id" {
  description = "VPC 네트워크의 고유 ID"
  value       = module.vpc_network.id
}

output "name" {
  description = "VPC 네트워크의 이름"
  value       = module.vpc_network.name
}

output "self_link" {
  description = "VPC 네트워크의 self-link (고유 URI)"
  value       = module.vpc_network.self_link
}

output "routing_mode" {
  description = "VPC 네트워크의 라우팅 모드 (REGIONAL 또는 GLOBAL)"
  value       = module.vpc_network.routing_mode
}

output "gateway_ipv4" {
  description = "VPC 네트워크의 기본 게이트웨이 IP 주소"
  value       = module.vpc_network.gateway_ipv4
}

output "project" {
  description = "VPC 네트워크가 속한 GCP 프로젝트 ID"
  value       = module.vpc_network.project
}