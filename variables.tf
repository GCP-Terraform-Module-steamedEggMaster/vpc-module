variable "project_id" {
  description = "The name of the project"
  type        = string
}

variable "vpc_network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "routing_mode" {
  description = "The routing mode for the network"
  type        = string
  default     = "REGIONAL" # 기본값 설정
}

variable "auto_create_subnetworks" {
  description = "Whether to auto-create subnetworks"
  type        = bool
  default     = false
}

variable "mtu" {
  description = "The Maximum Transmission Unit (MTU) for the network"
  type        = number
  default     = 1460
}

variable "delete_default_routes_on_create" {
  description = "Whether to delete default routes on create"
  type        = bool
  default     = false
}