variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version of the EKS cluster"
  type        = string
  default     = "1.21"
}

variable "node_group_name" {
  description = "The name of the node group"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type for worker nodes"
  type        = string
}

variable "node_count" {
  description = "The number of EC2 instances in the node group"
  type        = number
}

variable "subnet_ids" {
  description = "List of subnets in the VPC"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "cluster_role_arn" {
  description = "The IAM role ARN for the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "The IAM role ARN for the worker nodes"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID for EC2 instances"
  type        = string
}

variable "ssh_key_name" {
  description = "The SSH key for EC2 instance access"
  type        = string
}
