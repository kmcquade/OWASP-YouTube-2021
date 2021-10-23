# Terraform to run Fargate in CodeBuild:
# https://github.com/toniblyx/prowler/blob/master/util/codebuild/codebuild-prowler-audit-account-cfn.yaml
variable "region" {
  default = "us-east-1"
  description = "The AWS region to deploy to. Deploying in us-east-1 across the entire demo (sorry)."
}
variable "service_name" {
  default = "prowler"
  description = "Specifies the service name used within component naming"
  type = string
}

variable "logs_retention_in_days" {
  description = "Specifies the number of days you want to retain CodeBuild run log events in the specified log group. Junit reports are kept for 30 days, HTML reports in S3 are not deleted. Allowed values: [1, 3, 5, 7, 14, 30, 60, 90, 180, 365]"
  #    AllowedValues: [1, 3, 5, 7, 14, 30, 60, 90, 180, 365]
  type = number
  default = 3
}

variable "prowler_options" {
  type = string
  description = "Options to pass to Prowler command, make sure at least -M junit-xml is used for CodeBuild reports. Use -r for the region to send API queries, -f to filter only one region, -M output formats, -c for comma separated checks, for all checks do not use -c or -g, for more options see -h. For a complete assessment use  '-M text,junit-xml,html,csv,json', for SecurityHub integration use '-r region -f region -M text,junit-xml,html,csv,json,json-asff -S -q'"
  # I changed this to include us-east-1 as the default region
  default = "-r us-east-1 -f us-east-1 -M text,junit-xml,html,csv,json,json-asff -S -q"
}

variable "prowler_scheduler" {
  type = string
  description = "The time when Prowler will run in cron format. Default is daily at 22:00h or 10PM 'cron(0 22 * * ? *)', for every 5 hours also works 'rate(5 hours)'. More info here https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html."
  default = "cron(0 22 * * ? *)"
}