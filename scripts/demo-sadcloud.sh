#!/usr/bin/env bash
set -x

cp sadcloud-demo.auto.tfvars sadcloud/sadcloud/terraform.tfvars
# shellcheck disable=SC2164
cd ./sadcloud/sadcloud
export AWS_DEFAULT_PROFILE="vulnerable-aws"
export AWS_PROFILE="vulnerable-aws"
export AWS_DEFAULT_REGION="us-west-1"
pwd
terraform init
terraform get
terraform plan
terraform apply -auto-approve
cd ../../