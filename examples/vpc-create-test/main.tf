module "vpc_network" {
  source = "../../" # 모듈 경로

  # 필수 변수
  name = "test-vpc-network"

  # 선택적 변수
  description                     = "Example VPC network for production environment"
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
  mtu                             = 1500
  delete_default_routes_on_create = true
}
