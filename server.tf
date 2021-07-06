terraform {
  required_version = "= 0.12.26"
  backend "s3" {
    bucket         = "mycompany-terraform-s3-backend"
    key            = "terraform-platform-test.tfstate"
    region         = "ap-northeast-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  version = "~> 2.66"
  region = "us-east-2"
}
