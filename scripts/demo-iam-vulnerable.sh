#!/usr/bin/env bash
set -x

cp iam-vulnerable-demo.auto.tfvars iam-vulnerable/terraform.tfvars
# shellcheck disable=SC2164
cd ./iam-vulnerable
export AWS_DEFAULT_PROFILE="vulnerable-aws"
export AWS_PROFILE="vulnerable-aws"
export AWS_DEFAULT_REGION="us-east-1"
pwd
terraform init
terraform get
terraform plan
terraform apply -auto-approve
cd ../../