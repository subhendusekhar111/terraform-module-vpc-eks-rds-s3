variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "bucket_acl" {
  description = "The canned ACL to apply to the bucket"
  type        = string
  default     = "private"  # Default is private access
}

variable "versioning" {
  description = "Enable versioning on the S3 bucket"
  type        = bool
  default     = false
}

variable "encryption_algorithm" {
  description = "The server-side encryption algorithm to use"
  type        = string
  default     = "AES256"  # Default encryption algorithm is AES256
}

variable "tags" {
  description = "Tags to associate with the S3 bucket"
  type        = map(string)
  default     = {}
}

variable "expiration_days" {
  description = "The number of days after which to expire objects in the bucket"
  type        = number
  default     = 30
}

variable "lifecycle_prefix" {
  description = "Prefix for lifecycle rule filtering"
  type        = string
  default     = ""
}
