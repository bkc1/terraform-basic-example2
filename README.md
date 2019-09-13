# Basic terraform example

## Overview

Reference code highlights Terraform S3 remote state files,  outputs across different projects and seperate variable files

## Prereqs & Dependencies
* Manually create two S3 buckets in your AWS account as a destination for your Terraform remote state files. These buckets should have versioning enabled.
* Update the bucket names parameters in the file main.tf for both example2a and example2b


* Create SSH keys in the ./example2b/keys directory:

```sh
ssh-keygen -t rsa -f ./keys/mykey -N ""
```

## Usage

In the example2a directory run:
```sh
$ terraform init
$ terraform plan  -var-file=env_dev/dev.tfvars
$ terraform apply  -var-file=env_dev/dev.tfvars  ## This will take 10-15min due to the AuroraDB cluster having to initialize
```

Once example2a has completely deployed, change to the example2b directory and run:
```sh
$ terraform init
$ terraform plan  -var-file=env_dev/dev.tfvars -var-file=env_dev/secrets.tfvars
$ terraform apply  -var-file=env_dev/dev.tfvars -var-file=env_dev/secrets.tfvars
```
 

When you’re done, in reverse order, destroy example2b, then example2a like so:

In the example2b directory run:

```$ terraform destroy  -var-file=env_dev/dev.tfvars -var-file=env_dev/secrets.tfvars```

-In the example2a directory run:

```$ terraform destroy -var-file=env_dev/dev.tfvars```
