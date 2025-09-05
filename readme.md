pipeline :
variables:
  TF_VAR_astro_roledeploy_parameters: "[{\"key\":\"TempDir\",\"value\":\"/tmp/glue-job\"}]"

Optional:
variables:
  TF_VAR_astro_roledeploy_parameters: "[{\"key\":\"TempDir\",\"value\":\"/tmp/glue-job\"}, {\"key\":\"JobName\",\"value\":\"cloudtrail-glue-job\"}]"

Terraform: 

resource "aws_servicecatalog_provisioned_product" "example" {
  # ... other config ...

  # Add static required parameter directly
  provisioning_parameters {
    key   = "TempDir"
    value = "/tmp/glue-job"
  }

  # Keep your dynamic block for others
  dynamic "provisioning_parameters" {
    for_each = var.astro_roledeploy_parameters
    content {
      key   = provisioning_parameters.key
      value = provisioning_parameters.value
    }
  }

 # Add static required parameter directly
  provisioning_parameters {
    key   = "TempDir"
    value = "/tmp/glue-job"
  }
}

