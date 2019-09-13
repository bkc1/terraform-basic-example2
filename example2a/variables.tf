variable "aws_region" {
  description = "AWS region to launch servers"
  default     = "us-west-2"
}

variable "app_prefix" {
  description = "Application abbreviation/prefix"
  default     = "example2"
}

variable "az" {
  description = "Availability Zones per region"
  default = {
    us-east-1 = "us-east-1a,us-east-1c,us-east-1d,us-east-1e"
    us-west-1 = "us-west-1b,us-west-1c"
    us-west-2 = "us-west-2a,us-west-2b,us-west-2c"
  }
}

#Util Bastion Subnets
variable "util_bastion_cidr" {
  default = "10.3.1.64/26"
}


variable "env" { }

variable "domain_name" { }

variable "vpc_cidr_block" { }

variable "subnet1" { }

variable "subnet2" { }

