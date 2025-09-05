variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "product_id" {
  description = "Service Catalog product ID"
  type        = string
  default     = "124930443440-apps3landing-roles"
}
