provider "aws" {
  region = "${var.aws_region}"
  version = "~> 0.1"
}

##Unique bucket name must be pre-created in S3, enable versioning on buckets
terraform {
  required_version = ">= 0.10.7"
  backend "s3" {
    bucket = "example2a-dev-tf-state"  ##TODO: update this to your bucket name
    key    = "terraform-dev.tfstate"
    region = "us-west-2"
  }
}
