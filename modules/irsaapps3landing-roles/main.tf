resource "aws_servicecatalog_provisioned_product" "irsa_role" {
  name               = var.role_name
  product_id         = var.product_id
  provisioning_artifact_id = data.aws_servicecatalog_provisioning_artifacts.product_artifacts[0].id
  ignore_errors      = false

  provisioned_product_name = var.role_name

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

data "aws_servicecatalog_provisioning_artifacts" "product_artifacts" {
  product_id = var.product_id
}
