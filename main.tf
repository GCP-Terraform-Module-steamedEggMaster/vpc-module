resource "google_compute_network" "main" {
  name                            = var.vpc_network_name
  routing_mode                    = var.routing_mode
  auto_create_subnetworks         = var.auto_create_subnetworks
  mtu                             = var.mtu
  delete_default_routes_on_create = var.delete_default_routes_on_create
  ## api 활성화 모듈 먼저 실행 후, 실행되도록 파이프라인 설정하기
}