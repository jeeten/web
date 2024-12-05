terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.69.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "developer"
  shared_credentials_file = "C:/Users/hp/.aws/credentials"
}
