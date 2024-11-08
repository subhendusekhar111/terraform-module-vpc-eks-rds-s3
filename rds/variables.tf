variable "db_instance_identifier" {
  description = "The name of the DB instance"
  type        = string
}

variable "db_engine_version" {
  description = "The version of the MySQL engine"
  type        = string
  default     = "8.0" # or whichever version you'd prefer
}

variable "db_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "The allocated storage (in GB) for the RDS instance"
  type        = number
  default     = 20
}

variable "db_storage_type" {
  description = "The storage type for the RDS instance"
  type        = string
  default     = "gp2"  # General Purpose SSD
}

variable "db_username" {
  description = "The database master username"
  type        = string
}

variable "db_password" {
  description = "The database master password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created"
  type        = string
}

variable "db_parameter_group_name" {
  description = "The DB parameter group to associate with the DB instance"
  type        = string
  default     = "default.mysql8.0"  # or any other parameter group
}

variable "db_multi_az" {
  description = "Whether the RDS instance should be Multi-AZ"
  type        = bool
  default     = false
}

variable "db_backup_retention_period" {
  description = "The number of days to retain backups for the DB instance"
  type        = number
  default     = 7
}

variable "db_subnet_group_name" {
  description = "The DB subnet group name"
  type        = string
}

variable "db_publicly_accessible" {
  description = "Whether the DB instance should be publicly accessible"
  type        = bool
  default     = false
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the DB instance"
  type        = list(string)
}

variable "db_subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "db_storage_encrypted" {
  description = "Whether the DB instance should be encrypted"
  type        = bool
  default     = true
}
