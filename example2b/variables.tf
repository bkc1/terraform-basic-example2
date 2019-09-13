
variable "public_key_path" {
  description = "Enter path to the public key"
}

variable "key_name" {
  description = "Enter name of private key"
}

variable "aws_region" {
  description = "AWS region to launch servers"
  default     = "us-west-2"
}

variable "app_prefix" {
  description = "Application abbreviation/prefix"
  default     = "example2b"
}

variable "az" {
  description = "Availability Zones per region"
  default = {
    us-east-1 = "us-east-1a,us-east-1c,us-east-1d,us-east-1e"
    us-west-1 = "us-west-1b,us-west-1c"
    us-west-2 = "us-west-2a,us-west-2b,us-west-2c"
  }
}

# CentOS 7 (x86_64) - with Updates HVM
variable "aws_amis" {
  description = "CentOS7 (x86_64)"
  default = {
    eu-west-1 = ""
    us-east-1 = "ami-ae7bfdb8"
    us-west-1 = "ami-7c280d1c"
    us-west-2 = "ami-0c2aba6c"
  }
}

######## Env-specific, defined in env tfvars 

variable "env" { }

variable "ec2_type" { }




