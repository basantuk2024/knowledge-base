resource "aws_servicecatalog_provisioned_product" "example" {
  name                        = "edp-astrocloudwatchcloudtrail-roles-dev"
  product_id                 = "prod-abc123"
  provisioning_artifact_id  = "pa-xyz456"

  provisioning_parameters = [
    {
      key   = "TempDir"
      value = "/tmp/glue-job"
    },
    {
      key   = "GlueJobName"
      value = "ETLGlueJob-${var.environment}" # Or hardcoded like "ETLGlueJob-dev"
    }
  ]
}
