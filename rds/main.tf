resource "aws_db_instance" "mysql" {
  identifier        = var.db_instance_identifier
  engine            = "mysql"
  engine_version    = var.db_engine_version
  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  storage_type      = var.db_storage_type
  username          = var.db_username
  password          = var.db_password
  db_name           = var.db_name
  parameter_group_name = var.db_parameter_group_name
  multi_az          = var.db_multi_az
  backup_retention_period = var.db_backup_retention_period

  vpc_security_group_ids = var.security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name
  publicly_accessible    = var.db_publicly_accessible

  tags = {
    Name = var.db_instance_identifier
  }

  # For encryption (optional)
  storage_encrypted = var.db_storage_encrypted
}

resource "aws_db_subnet_group" "mysql" {
  name        = var.db_subnet_group_name
  subnet_ids  = var.db_subnet_ids
  description = "MySQL DB subnet group"
}

output "rds_endpoint" {
  value = aws_db_instance.mysql.endpoint
}

output "rds_instance_id" {
  value = aws_db_instance.mysql.id
}
