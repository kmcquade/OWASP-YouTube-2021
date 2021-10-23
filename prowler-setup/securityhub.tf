data "aws_region" "current" {}

resource "aws_securityhub_account" "main" {}

# --------------------------------------------------------------------------------------------------
# Enable Prowler as partner integration integration
# --------------------------------------------------------------------------------------------------
resource "aws_securityhub_product_subscription" "prowler" {
  product_arn = "arn:aws:securityhub:${data.aws_region.current.name}::product/prowler/prowler"
  depends_on = [aws_securityhub_account.main]
}
