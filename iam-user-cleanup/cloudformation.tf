resource "aws_cloudformation_stack" "iam_user_cleanup" {
  name = var.service_name
  parameters = {
    NotificationEmail = var.notification_email
    MinAgeKeysToReport = var.min_age_keys_to_report
    MinAgeKeysToDisable = var.min_age_keys_to_disable
    MinAgeKeysToDelete = var.min_age_keys_to_delete
    MinAgeUnusedUsersToReport = var.min_age_unused_users_to_report
    MinAgeUnusedUsersToDisable = var.min_age_unused_users_to_disable
    MinAgeUnusedUsersToDelete = var.min_age_unused_users_to_delete
    MinAgeRolesToReport = var.min_age_roles_to_report
    MinAgeRolesToDisable = var.min_age_roles_to_disable
    MinAgeRolesToDelete = var.min_age_roles_to_delete
    AnalyzerType = var.analyzer_type
  }
  template_body = file("${path.module}/cloudformation-iam-user-cleanup.yaml")
  capabilities = ["CAPABILITY_AUTO_EXPAND", "CAPABILITY_IAM"]
}