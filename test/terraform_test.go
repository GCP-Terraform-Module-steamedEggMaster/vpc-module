package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformModule(t *testing.T) {
	// 환경 변수에서 GCP 프로젝트 ID 가져오기
	projectID := os.Getenv("GCP_PROJECT_ID")

	// Terraform 모듈 옵션 설정
	terraformOptions := &terraform.Options{
		TerraformDir: "../", // 모듈 경로
		Vars: map[string]interface{}{
			"vpc_network_name":            "test-network",
			"routing_mode":                "REGIONAL",
			"auto_create_subnetworks":     false,
			"mtu":                         1460,
			"delete_default_routes_on_create": false,
		},
	}

	// Terraform Destroy 실행 (테스트 완료 후 정리)
	defer terraform.Destroy(t, terraformOptions)

	// Terraform Init 및 Apply 실행
	terraform.InitAndApply(t, terraformOptions)

	// 출력값 가져오기
	actualNetworkName := terraform.Output(t, terraformOptions, "network_name")
	actualSelfLink := terraform.Output(t, terraformOptions, "network_self_link")
	actualNetworkID := terraform.Output(t, terraformOptions, "network_id") // VPC ID 출력값 가져오기

	// 예상값 정의
	expectedNetworkName := "test-network"
	expectedNetworkID := fmt.Sprintf("projects/%s/global/networks/%s", projectID, expectedNetworkName)

	assert.Equal(t, expectedNetworkName, actualNetworkName, "Unexpected network name") 	// 검증: 네트워크 이름
	assert.Contains(t, actualSelfLink, expectedNetworkName, "Self-link does not contain the network name")  // 검증: Self-Link에 네트워크 이름 포함 여부
	assert.Equal(t, expectedNetworkID, actualNetworkID, "Unexpected network ID")  // 검증: VPC ID
}
