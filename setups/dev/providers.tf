terraform {
  backend "s3" {
    bucket         = "test-12-04-1992-test"
    key            = "dev/test-12-04-1992-test"
    dynamodb_table = "test-12-04-1992-test-tf-locking"
    region         = "eu-west-2"
    encrypt        = true
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}
