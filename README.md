# vpc-module
GCP Terraform vpc module Repo

이 모듈은 GCP에서 서비스 계정을 생성하고 관리하기 위한 모듈입니다.  <br>
서비스 계정 생성, 속성 설정, 출력값 확인을 간단히 할 수 있도록 설계되었습니다.

<br>

## 📑 **목차**
1. [모듈 특징](#모듈-특징)
2. [사용 방법](#사용-방법)
    1. [사전 준비](#1-사전-준비)
    2. [입력 변수](#2-입력-변수)
    3. [모듈 호출 예시](#3-모듈-호출-예시)
    4. [출력값 (Outputs)](#4-출력값-outputs)
    5. [지원 버전](#5-지원-버전)
    6. [모듈 개발 및 관리](#6-모듈-개발-및-관리)
3. [테스트](#terratest를-이용한-테스트)
4. [주요 버전 관리](#주요-버전-관리)
5. [기여](#기여-contributing)
6. [라이선스](#라이선스-license)

---

## 모듈 특징

- 사용자 정의 VPC 네트워크 생성.
- 자동 서브네트워크 생성 비활성화 옵션 제공.
- 네트워크 라우팅 모드 설정 가능 (`REGIONAL` 또는 `GLOBAL`).
- IPv6 설정 및 MTU(Maximum Transmission Unit) 설정 지원.
- 기본 경로 삭제 옵션 제공.

---

## 사용 방법

### 1. 사전 준비

다음 사항을 확인하세요:
1. Google Cloud 프로젝트 준비.
2. 적절한 IAM 권한 필요: `roles/compute.networkAdmin` (VPC 네트워크 관리 권한 필수).

<br>

### 2. 입력 변수

| 변수명                                | 타입   | 필수 여부 | 기본값                  | 설명                                   |
|---------------------------------------|--------|-----------|-------------------------|----------------------------------------|
| `name`                                | string | ✅        | 없음                    | 네트워크 이름 (RFC1035 규칙 준수)      |
| `description`                         | string | ❌        | `null`                  | 네트워크 설명                         |
| `auto_create_subnetworks`             | bool   | ❌        | `true`                  | 자동 서브네트워크 생성 여부            |
| `routing_mode`                        | string | ❌        | `REGIONAL`              | 네트워크 라우팅 모드 (`REGIONAL` 또는 `GLOBAL`) |
| `mtu`                                 | number | ❌        | `1460`                  | 네트워크의 최대 전송 단위              |
| `delete_default_routes_on_create`     | bool   | ❌        | `false`                 | 기본 라우트 삭제 여부                 |
| `enable_ula_internal_ipv6`            | bool   | ❌        | `null`                  | ULA 내부 IPv6 활성화 여부             |
| `internal_ipv6_range`                 | string | ❌        | `null`                  | 활성화된 ULA 내부 IPv6 범위 (/48)     |
| `network_firewall_policy_enforcement_order` | string | ❌   | `AFTER_CLASSIC_FIREWALL` | 방화벽 정책 평가 순서 설정           |
| `project`                             | string | ✅        | 없음                    | 네트워크가 속한 GCP 프로젝트 ID       |
| `timeout_create`                      | string | ❌        | `20m`                   | 리소스 생성 제한 시간                 |
| `timeout_update`                      | string | ❌        | `20m`                   | 리소스 업데이트 제한 시간             |
| `timeout_delete`                      | string | ❌        | `20m`                   | 리소스 삭제 제한 시간                 |

<br>

### 3. 모듈 호출 예시

```hcl
module "vpc_network" {
  source = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/vpc-module.git?ref=v1.0.0"

  name                                = "custom-vpc"
  description                         = "Custom VPC Network"
  auto_create_subnetworks             = false
  routing_mode                        = "GLOBAL"
  mtu                                 = 1460
  delete_default_routes_on_create     = true
  enable_ula_internal_ipv6            = true
  internal_ipv6_range                 = "fd20:1234:abcd::/48"
  project                             = "your-gcp-project-id"
  network_firewall_policy_enforcement_order = "BEFORE_CLASSIC_FIREWALL"
  timeout_create                      = "30m"
  timeout_update                      = "30m"
  timeout_delete                      = "30m"
}
```

<br>

### 4. 출력값 (Outputs)

| 출력명                   | 설명                                   |
|--------------------------|----------------------------------------|
| `id`                    | VPC 네트워크의 고유 ID                 |
| `name`                  | VPC 네트워크의 이름                    |
| `self_link`             | VPC 네트워크의 self-link (URI)         |
| `routing_mode`          | VPC 네트워크의 라우팅 모드             |
| `gateway_ipv4`          | VPC 네트워크의 기본 게이트웨이 IP 주소 |
| `project`               | 네트워크가 속한 GCP 프로젝트 ID        |
| `auto_create_subnetworks` | 자동 서브네트워크 생성 여부            |
| `mtu`                   | VPC 네트워크의 최대 전송 단위          |
| `enable_ula_internal_ipv6` | 내부 ULA IPv6 활성화 여부             |

<br>

### 5. 지원 버전

#### a.  Terraform 버전
| 버전 범위 | 설명                              |
|-----------|-----------------------------------|
| `1.10.3`   | 최신 버전, 지원 및 테스트 완료                  |

#### b. Google Provider 버전
| 버전 범위 | 설명                              |
|-----------|-----------------------------------|
| `~> 4.0`  | 최소 지원 버전                   |


<br>

### 6. 모듈 개발 및 관리

- **저장소 구조**:
  ```
  vpc-module/
  ├── .github/workflows/  # github actions 자동화 테스트
  ├── examples/           # 테스트를 위한 루트 모듈 모음 디렉터리
  ├── test/               # 테스트 구성 디렉터리
  ├── main.tf             # 모듈의 핵심 구현
  ├── variables.tf        # 입력 변수 정의
  ├── outputs.tf          # 출력 정의
  ├── README.md           # 문서화 파일
  ```
<br>


---

## Terratest를 이용한 테스트
이 모듈을 테스트하려면 제공된 Go 기반 테스트 프레임워크를 사용하세요. 아래를 확인하세요:

1. Terraform 및 Go 설치.
2. 필요한 환경 변수 설정 (GCP_PROJECT_ID, API_SERVICES 등).
3. 테스트 실행:
```bash
go test -v ./test
```

<br>

## 주요 버전 관리
이 모듈은 [Semantic Versioning](https://semver.org/)을 따릅니다.  
안정된 버전을 사용하려면 `?ref=<version>`을 활용하세요:

```hcl
source = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/vpc-module.git?ref=v1.0.0"
```

### Module ref 버전
| Major | Minor | Patch |
|-----------|-----------|----------|
| `1.0.0`   |    |   |


<br>

## 기여 (Contributing)
기여를 환영합니다! 버그 제보 및 기능 요청은 GitHub Issues를 통해 제출해주세요.

<br>

## 라이선스 (License)
[MIT License](LICENSE)