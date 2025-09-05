This is test role repository 
# Terraform Module for AWS Service Catalog IAM Role

This repository provisions the `svc-edp-astro-irsa-dev` IAM role using an existing Service Catalog product.

## Usage

```bash
terraform init
terraform plan -var-file="modules/irsaapps3landing-roles/dev.tfvars"
terraform apply -var-file="modules/irsaapps3landing-roles/dev.tfvars"
