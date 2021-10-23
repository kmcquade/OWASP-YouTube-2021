#!/usr/bin/env bash
set -x

# AWS environment variables
export AWS_DEFAULT_PROFILE="vulnerable-aws"
export AWS_DEFAULT_REGION="us-east-1"

# sadcloud
# shellcheck disable=SC2164
cd ./sadcloud/sadcloud
terraform destroy -auto-approve
cd ../../

# resource exposure
cd ./resource-exposure
terraform destroy -auto-approve
cd ../../


# iam-vulnerable
# shellcheck disable=SC2164
#cd iam-vulnerable
