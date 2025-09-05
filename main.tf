module "irsaapps3landing_roles" {
  source      = "./modules/irsaapps3landing-roles"
  role_name   = "svc-edp-astro-irsa-${var.environment}"
  environment = var.environment
  product_id  = var.product_id
  aws_region  = var.aws_region
}
