
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}
output "eks_cluster_id" {
  value = module.eks.cluster_id
}
output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "rds_instance_id" {
  value = module.rds.rds_instance_id
}
output "s3_bucket_id" {
  value = module.s3_bucket.bucket_id
}

output "s3_bucket_arn" {
  value = module.s3_bucket.bucket_arn
}