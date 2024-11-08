resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = var.bucket_acl

  # Enable versioning if specified
  versioning {
    enabled = var.versioning
  }

  # Enable server-side encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.encryption_algorithm
      }
    }
  }

  tags = var.tags
}

# Optionally, add lifecycle rules (e.g., for object expiration)
resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    id     = "expire-objects"
    status = "Enabled"

    expiration {
      days = var.expiration_days
    }

    filter {
      prefix = var.lifecycle_prefix
    }
  }
}

output "bucket_id" {
  value = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "bucket_domain_name" {
  value = aws_s3_bucket.bucket.website_endpoint
}

output "bucket_id" {
  description = "The S3 bucket ID"
  value       = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  description = "The S3 bucket ARN"
  value       = aws_s3_bucket.bucket.arn
}

output "bucket_domain_name" {
  description = "The domain name of the S3 bucket (useful for static website hosting)"
  value       = aws_s3_bucket.bucket.website_endpoint
}
