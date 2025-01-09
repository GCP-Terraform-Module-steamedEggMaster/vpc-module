resource "google_compute_network" "network" {
  # 필수 옵션
  name = var.name # 네트워크 이름

  # 선택적 옵션
  ## 기본 설정
  description                     = var.description                     # 네트워크 설명
  auto_create_subnetworks         = var.auto_create_subnetworks         # 자동 서브네트워크 생성 여부
  routing_mode                    = var.routing_mode                    # 라우팅 모드 (REGIONAL/GLOBAL)
  mtu                             = var.mtu                             # 네트워크의 최대 전송 단위
  delete_default_routes_on_create = var.delete_default_routes_on_create # 기본 라우트 삭제 여부

  ## IPv6 관련 설정
  enable_ula_internal_ipv6 = var.enable_ula_internal_ipv6 # 내부 ULA IPv6 활성화 여부
  internal_ipv6_range      = var.internal_ipv6_range      # 내부 IPv6 범위 (/48)

  ## 방화벽 및 네트워크 프로필
  network_firewall_policy_enforcement_order = var.network_firewall_policy_enforcement_order # 방화벽 정책 순서
  network_profile                           = var.network_profile                           # 네트워크 프로필

  ## 프로젝트 정보
  project = var.project # 네트워크가 속한 프로젝트 ID

  # Timeout 설정
  timeouts {
    create = var.timeout_create # 리소스 생성 제한 시간
    update = var.timeout_update # 리소스 업데이트 제한 시간
    delete = var.timeout_delete # 리소스 삭제 제한 시간
  }
}