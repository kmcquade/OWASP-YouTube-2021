all_findings = true
#all_findings = false
all_cloudformation_findings = true
all_cloudtrail_findings = true
all_cloudwatch_findings = true
all_config_findings = true
all_ec2_findings = true # Warning: EKS module (10c/hour = $2.40/day)
#all_ec2_findings = false # Warning: EKS module (10c/hour = $2.40/day)
all_elb_findings = true
all_elbv2_findings = true
all_eks_findings = false
all_iam_findings = true
all_rds_findings = true
all_redshift_findings = true  # Redshift module (25c/hour = $6/day)
#all_redshift_findings = false  # Redshift module (25c/hour = $6/day)
all_s3_findings = true
all_ses_findings = true
all_sns_findings = true
all_sqs_findings = true
