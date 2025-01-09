package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformModule(t *testing.T) {

	// Terraform 모듈 옵션 설정
	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/vpc-create-test", // 모듈 경로
	}

	// Terraform Destroy 실행 (테스트 완료 후 정리)
	defer terraform.Destroy(t, terraformOptions)

	// Terraform Init 및 Apply 실행
	terraform.InitAndApply(t, terraformOptions)
}
