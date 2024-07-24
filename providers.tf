terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.32.1"
    }
  }
  backend "s3" {
    bucket         = "svc-global-terragrunt-mike"
    key            = "mike-tf/doiteasy.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-mike-lock"
    encrypt        = true
  }
}


provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.tags
  }
}


