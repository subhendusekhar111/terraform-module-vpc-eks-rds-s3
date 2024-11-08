variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-west-2"
}

# NETWORKING VAriables
#--------------------------

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "my-vpc"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

#   COMPUTE VARIABLES
#---------------------------------------------

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key name for SSH access"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
}
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

#EKS Cluster variables
#--------------------------------

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.21"
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type for the worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "node_count" {
  description = "The number of EC2 instances in the node group"
  type        = number
  default     = 3
}
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "bucket_acl" {
  description = "The canned ACL to apply to the bucket"
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "Enable versioning on the S3 bucket"
  type        = bool
  default     = false
}

