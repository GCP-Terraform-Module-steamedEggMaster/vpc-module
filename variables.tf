# 필수 변수
variable "name" {
  description = "네트워크 이름 (RFC1035 규칙 준수)"
  type        = string
}

# 선택적 변수

## 기본 설정
variable "description" {
  description = "네트워크 설명 (선택 사항)"
  type        = string
  default     = null
}

variable "auto_create_subnetworks" {
  description = "자동 서브네트워크 생성 여부 (true: 자동, false: 사용자 정의)"
  type        = bool
  default     = true
}

variable "routing_mode" {
  description = "네트워크의 라우팅 모드 (REGIONAL 또는 GLOBAL)"
  type        = string
  default     = "REGIONAL"
}

variable "mtu" {
  description = "네트워크의 최대 전송 단위 (기본값: 1460)"
  type        = number
  default     = 1460
}

variable "delete_default_routes_on_create" {
  description = "기본 라우트 삭제 여부 (기본값: false)"
  type        = bool
  default     = false
}

## IPv6 관련 설정
variable "enable_ula_internal_ipv6" {
  description = "ULA 내부 IPv6 활성화 여부"
  type        = bool
  default     = null
}

variable "internal_ipv6_range" {
  description = "활성화된 ULA 내부 IPv6 범위 (/48)"
  type        = string
  default     = null
}

## 방화벽 및 네트워크 프로파일
variable "network_firewall_policy_enforcement_order" {
  description = "방화벽 규칙 및 정책 평가 순서 (BEFORE_CLASSIC_FIREWALL 또는 AFTER_CLASSIC_FIREWALL)"
  type        = string
  default     = "AFTER_CLASSIC_FIREWALL"
}

## 프로젝트 정보
variable "project" {
  description = "네트워크가 속한 GCP 프로젝트 ID"
  type        = string
  default     = null
}

# Timeout 변수
variable "timeout_create" {
  description = "리소스 생성 제한 시간"
  type        = string
  default     = "20m"
}

variable "timeout_update" {
  description = "리소스 업데이트 제한 시간"
  type        = string
  default     = "20m"
}

variable "timeout_delete" {
  description = "리소스 삭제 제한 시간"
  type        = string
  default     = "20m"
}
