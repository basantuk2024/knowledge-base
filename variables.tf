# Required Variables
variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "db_identifier" {
  description = "The DB instance identifier"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the database will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
}

variable "password" {
  description = "Password for the master DB user"
  type        = string
  sensitive   = true
}

# Optional Variables with Defaults
variable "engine" {
  description = "The database engine"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The engine version"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "The upper limit for automatic storage scaling"
  type        = number
  default     = 100
}

variable "storage_type" {
  description = "The storage type"
  type        = string
  default     = "gp2"
}

variable "storage_encrypted" {
  description = "Whether the DB instance is encrypted"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "The KMS key ID for encryption"
  type        = string
  default     = ""
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = ""
}

variable "db_port" {
  description = "The port on which the DB accepts connections"
  type        = number
  default     = 3306
}

variable "publicly_accessible" {
  description = "Whether the DB instance is publicly accessible"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "The daily time range for backups"
  type        = string
  default     = "03:00-04:00"
}

variable "maintenance_window" {
  description = "The window to perform maintenance in"
  type        = string
  default     = "sun:04:00-sun:05:00"
}

variable "monitoring_interval" {
  description = "The interval for collecting enhanced monitoring metrics"
  type        = number
  default     = 0
}

variable "monitoring_role_arn" {
  description = "The ARN for the IAM role for enhanced monitoring"
  type        = string
  default     = ""
}

variable "performance_insights_enabled" {
  description = "Whether to enable Performance Insights"
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Whether minor engine upgrades are applied automatically"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Whether deletion protection is enabled"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final DB snapshot"
  type        = bool
  default     = false
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group"
  type        = string
  default     = ""
}

variable "allowed_security_groups" {
  description = "List of security group IDs allowed to connect"
  type        = list(string)
  default     = []
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to connect"
  type        = list(string)
  default     = []
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
  default     = {}
}