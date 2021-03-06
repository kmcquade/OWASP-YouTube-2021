#!/usr/bin/env bash
set -x

# shellcheck disable=SC2164
cd ./prowler-setup
export AWS_DEFAULT_PROFILE="vulnerable-aws"
export AWS_PROFILE="vulnerable-aws"
export AWS_DEFAULT_REGION="us-east-1"
pwd
terraform init
terraform get
terraform plan
terraform apply -auto-approve
cd ../../