#!/usr/bin/env bash
set -x

# shellcheck disable=SC2164
cd ./resource-exposure
export AWS_DEFAULT_PROFILE="vulnerable-aws"
export AWS_PROFILE="vulnerable-aws"
export AWS_DEFAULT_REGION="us-east-1"
pwd
tfenv use 1.0.6
terraform init
terraform get
terraform plan
terraform apply -auto-approve
cd ../../