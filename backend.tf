terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "vpc/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "my-terraform-lock"
    encrypt        = true
  }
}