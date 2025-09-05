output "role_name" {
  value = aws_servicecatalog_provisioned_product.irsa_role.name
}

output "provisioned_product_id" {
  value = aws_servicecatalog_provisioned_product.irsa_role.id
}
