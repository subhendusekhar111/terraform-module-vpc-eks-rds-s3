module "vpc" {
  source = "./networking"

  vpc_name            = var.vpc_name
  cidr_block          = var.cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone    = var.availability_zone
}

module "ec2" {
  source = "./compute"

  ami_id           = var.ami_id
  instance_type    = var.instance_type
  key_name         = var.key_name
  subnet_id        = module.vpc.public_subnet_id
  associate_public_ip_address = true
}
module "eks" {
  source = "./eks"

  cluster_name     = var.cluster_name
  cluster_version  = var.cluster_version
  node_group_name  = var.node_group_name
  instance_type    = var.instance_type
  node_count       = var.node_count
  subnet_ids       = [module.vpc.public_subnet_id, module.vpc.private_subnet_id]
  vpc_id           = module.vpc.vpc_id
  cluster_role_arn = module.vpc.eks_cluster_role_arn
  node_role_arn    = module.vpc.eks_node_role_arn
}

module "rds" {
  source = "./rds"

  db_instance_identifier = var.db_instance_identifier
  db_engine_version      = var.db_engine_version
  db_instance_class      = var.db_instance_class
  db_allocated_storage   = var.db_allocated_storage
  db_storage_type        = var.db_storage_type
  db_username            = var.db_username
  db_password            = var.db_password
  db_name               = var.db_name
  db_parameter_group_name = var.db_parameter_group_name
  db_multi_az            = var.db_multi_az
  db_backup_retention_period = var.db_backup_retention_period
  security_group_ids     = var.security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name
  db_publicly_accessible = var.db_publicly_accessible
  db_subnet_ids          = var.db_subnet_ids
  db_storage_encrypted   = var.db_storage_encrypted
}

module "s3_bucket" {
  source = "./storage"  # Path to the S3 module

  bucket_name        = "my-unique-s3-bucket-name"
  bucket_acl         = "private"
  versioning         = true
  encryption_algorithm = "AES256"
  tags = {
    "Environment" = "Production"
    "Owner"       = "MyTeam"
  }
  expiration_days    = 90
  lifecycle_prefix   = "logs/"
}

