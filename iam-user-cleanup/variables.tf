variable "region" {
  default     = "us-east-1"
  description = "The AWS region to deploy to. Deploying in us-east-1 across the entire demo (sorry)."
}

variable "service_name" {
  default     = "iam-user-cleanup"
  description = "Specifies the service name used within component naming"
  type        = string
}
# ---------------------------------------------------------------------------------------------------------------------
# CloudFormation template variables
# ---------------------------------------------------------------------------------------------------------------------
variable "notification_email" {
  type        = string
  description = "The email address to send the list of affected users"
}
# Keys
variable "min_age_keys_to_report" {
  default     = 30
  type        = number
  description = "The minimum age in days of access keys to include in the report."
}

variable "min_age_keys_to_disable" {
  default     = 0
  type        = number
  description = "The minimum age in days of access keys to disable. Set to '0' to disable this function."
}
variable "min_age_keys_to_delete" {
  default     = 0
  type        = number
  description = "The minimum age in days of access keys to delete. Set to '0' to disable this function."
}
# Users
variable "min_age_unused_users_to_report" {
  default     = 30
  type        = number
  description = "The minimum age in days of unused users to include in the report."
}
variable "min_age_unused_users_to_disable" {
  default     = 0
  type        = number
  description = "The minimum age in days of unused users to disable. Set to '0' to disable this function."
}
variable "min_age_unused_users_to_delete" {
  default     = 0
  type        = number
  description = "The minimum age in days of unused users to delete. Set to '0' to disable this function."
}
# Roles
variable "min_age_roles_to_report" {
  default     = 30
  type        = number
  description = "The minimum age in days of unused users to include in the report."
}
variable "min_age_roles_to_disable" {
  default     = 0
  type        = number
  description = "The minimum age in days of unused users to disable. Set to '0' to disable this function."
}
variable "min_age_roles_to_delete" {
  default     = 0
  type        = number
  description = "The minimum age in days of unused users to delete. Set to '0' to disable this function."
}
variable "analyzer_type" {
  type        = string
  default     = "ACCOUNT"
  description = "IAM Access Analyzer produces findings on the external availability of resources within your AWS account. If this account is the root account of an organization or the delegated administrator select ORGANIZATION, otherwise select ACCOUNT or NONE to skip this check."
}