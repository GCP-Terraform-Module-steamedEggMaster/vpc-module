# vpc-module
GCP Terraform vpc module Repo

이 모듈은 GCP에서 VPC 네트워크를 생성하고 관리하기 위한 모듈입니다. <br>
사용자 정의 VPC 네트워크를 쉽게 구성할 수 있도록 설계되었습니다.

<br>

---

## 📋 **모듈 특징**

- 사용자 정의 VPC 네트워크 생성.
- 자동 서브네트워크 생성 비활성화 옵션 제공.
- 네트워크 라우팅 모드 설정 가능 (`REGIONAL` 또는 `GLOBAL`).
- MTU(Maximum Transmission Unit) 및 기본 경로 삭제 옵션 제공.

---

## 🔧 사용 방법

### 1. 사전 준비

다음 사항을 확인하세요:
1. Google Cloud 프로젝트 준비.
2. 적절한 IAM 권한 필요: `roles/compute.networkAdmin` (VPC 네트워크 관리 권한 필수).

<br>

### 2. 입력 변수

| 변수명                        | 타입   | 필수 여부 | 기본값             | 설명                                   |
|-------------------------------|--------|-----------|--------------------|----------------------------------------|
| `vpc_network_name`            | string | ✅        | 없음               | VPC 네트워크의 이름                    |
| `routing_mode`                | string | ❌        | `REGIONAL`         | 네트워크 라우팅 모드 (`REGIONAL` 또는 `GLOBAL`) |
| `auto_create_subnetworks`     | bool   | ❌        | `false`            | 자동 서브네트워크 생성 여부            |
| `mtu`                         | number | ❌        | `1460`             | 네트워크 MTU 설정                      |
| `delete_default_routes_on_create` | bool | ❌      | `false`            | 네트워크 생성 시 기본 경로 삭제 여부   |

<br>

### 3. 모듈 호출 예시

```hcl
module "vpc_network" {
  source = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/vpc-module.git?ref=v1.0.0"

  vpc_network_name            = "custom-vpc"
  routing_mode                = "REGIONAL"
  auto_create_subnetworks     = false
  mtu                         = 1460
  delete_default_routes_on_create = false
}
```

<br>

### 4. 출력값 (Outputs)

| 출력명               | 설명                                    |
|----------------------|-----------------------------------------|
| `network_name`  | 생성된 VPC 네트워크의 이름 |
| `network_self_link`  | 생성된 VPC 네트워크의 self-link |

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
  api-module/
    ├── main.tf        # 모듈의 핵심 구현
    ├── variables.tf   # 입력 변수 정의
    ├── outputs.tf     # 출력 정의
    ├── README.md      # 문서화 파일
    ├── test/          # 테스트 구성 디렉터리
  ```
<br>


---

### Terratest를 이용한 테스트
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