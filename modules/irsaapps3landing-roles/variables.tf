variable "role_name" {
  description = "Name of the IAM role to create"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "product_id" {
  description = "AWS Service Catalog product ID"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}
