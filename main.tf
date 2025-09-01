terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0"
}

# Data sources for existing resources
data "aws_vpc" "selected" {
  count = var.vpc_id != "" ? 1 : 0
  id    = var.vpc_id
}

data "aws_subnets" "selected" {
  count = length(var.subnet_ids) > 0 ? 1 : 0
  filter {
    name   = "subnet-id"
    values = var.subnet_ids
  }
}

# DB Subnet Group
resource "aws_db_subnet_group" "main" {
  name       = "${var.name_prefix}-db-subnet-group"
  subnet_ids = var.subnet_ids
  
  tags = merge(var.common_tags, {
    Name = "${var.name_prefix}-db-subnet-group"
  })
}

# Security Group for RDS
resource "aws_security_group" "rds" {
  name_prefix = "${var.name_prefix}-rds-"
  vpc_id      = var.vpc_id
  
  ingress {
    from_port       = var.db_port
    to_port         = var.db_port
    protocol        = "tcp"
    security_groups = var.allowed_security_groups
    cidr_blocks     = var.allowed_cidr_blocks
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = merge(var.common_tags, {
    Name = "${var.name_prefix}-rds-sg"
  })
  
  lifecycle {
    create_before_destroy = true
  }
}

# RDS Instance
resource "aws_db_instance" "main" {
  # Basic Configuration
  identifier = var.db_identifier
  engine     = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  
  # Database Configuration
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type         = var.storage_type
  storage_encrypted    = var.storage_encrypted
  kms_key_id          = var.kms_key_id
  
  # Database Settings
  db_name  = var.db_name
  username = var.username
  password = var.password
  port     = var.db_port
  
  # Network Configuration
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  publicly_accessible    = var.publicly_accessible
  
  # Backup Configuration
  backup_retention_period = var.backup_retention_period
  backup_window          = var.backup_window
  maintenance_window     = var.maintenance_window
  
  # Monitoring and Performance
  monitoring_interval = var.monitoring_interval
  monitoring_role_arn = var.monitoring_role_arn
  performance_insights_enabled = var.performance_insights_enabled
  
  # Other Settings
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  deletion_protection       = var.deletion_protection
  skip_final_snapshot      = var.skip_final_snapshot
  final_snapshot_identifier = var.skip_final_snapshot ? null : "${var.db_identifier}-final-snapshot-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"
  
  # Parameter Group
  parameter_group_name = var.parameter_group_name
  
  tags = merge(var.common_tags, {
    Name = var.db_identifier
  })
  
  lifecycle {
    ignore_changes = [
      password,
      final_snapshot_identifier
    ]
  }
}