provider "aws" {
  region  = var.aws_region
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
  # Optionally, specify a profile if using an AWS CLI profile.
  # profile = var.aws_profile
  version = "~> 4.0"  # Specify the version of the AWS provider (optional but recommended)
}

# storing AWS credentials directly in Terraform files (like access_key and secret_key) is not recommended for production use. Instead, it is better to use environment variables


# Commands to store access and secret key 
# ---------------------------------------

# export AWS_ACCESS_KEY_ID="your-access-key"
# export AWS_SECRET_ACCESS_KEY="your-secret-key"
# export AWS_DEFAULT_REGION="us-west-2"
