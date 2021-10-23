resource "aws_cloudformation_stack" "prowler" {
  name = var.service_name
  parameters = {
    ServiceName = var.service_name
    LogsRetentionInDays = var.logs_retention_in_days
    ProwlerOptions = var.prowler_options
    ProwlerScheduler = var.prowler_scheduler
  }
  template_body = file("${path.module}/codebuild-prowler-audit-account-cfn.yaml")
  depends_on = [aws_securityhub_product_subscription.prowler]
  capabilities = ["CAPABILITY_NAMED_IAM"]
}