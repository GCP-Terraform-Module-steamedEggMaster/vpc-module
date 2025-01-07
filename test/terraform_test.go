package test

import (
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformModule(t *testing.T) {
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

	// Terraform Apply 실행
	terraform.InitAndApply(t, terraformOptions)

	// 출력값 검증
	networkName := terraform.Output(t, terraformOptions, "network_name")
	networkSelfLink := terraform.Output(t, terraformOptions, "network_self_link")

	assert.Equal(t, "test-network", networkName, "Network name does not match")
	assert.Contains(t, networkSelfLink, "test-network", "Self-link does not contain network name")
}
