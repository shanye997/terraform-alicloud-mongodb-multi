package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
// Make sure you have the dep binary, https://github.com/golang/dep
// Run 'dep ensure' before run test cases.

func TestTerraformBasicExampleNew(t *testing.T) {
	t.Parallel()
	count := "1"
	engineVersion := "1.0.0"
	name := "mongo_db_test"
	instanceChargeType := "PostPaid"
	dbInstanceClass := "mongo.x8.medium"
	dbInstanceStorage := "10"
	period := "1"
	securityIpList := "[192.168.1.1]"
	replicationFactor := "2"
	storageEngine := "WiredTiger"
	vswitchId := "1"
	zoneId := "1"
	accountPassword := "test123abc"
	backupPeriod := ""
	backupTime := ""
	tags := ""

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "./basic/",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"count":                count,
			"engine_version":       engineVersion,
			"name":                 engineVersion,
			"instance_charge_type": instanceChargeType,
			"db_instance_class":   dbInstanceClass,
			"db_instance_storage": dbInstanceStorage,
			"period":              period,
			"security_ip_list":    securityIpList,
			"replication_factor":  replicationFactor,
			"storage_engine":      storageEngine,
			"vswitch_id":          vswitchId,
			"zone_id":             zoneId,
			"account_password":    accountPassword,
			"backup_period":       backupPeriod,
			"backup_time":         backupTime,
			"tags":                tags,
			// We also can see how lists and maps translate between terratest and terraform.
		},

		// Disable colors in Terraform commands, so it's easier to parse stdout/stderr
		NoColor: true,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	thisName := terraform.Output(t, terraformOptions, "name")
	thisInstanceType := terraform.Output(t, terraformOptions, "instance_charge_type")
	thisPassword := terraform.Output(t, terraformOptions, "account_password")
	thisInstanceStorage := terraform.Output(t, terraformOptions, "db_instance_storage")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, thisName, name)
	assert.Equal(t, thisInstanceType, instanceChargeType)
	assert.Equal(t, thisPassword, accountPassword)
	assert.Equal(t, thisInstanceStorage, dbInstanceStorage)
}
