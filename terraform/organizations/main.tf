################################################################################
# AWS Organizations
################################################################################
resource "aws_organizations_organization" "this" {
  feature_set = "ALL"
}

################################################################################
# Foundational OU
################################################################################
resource "aws_organizations_organizational_unit" "foundational" {
  name      = "Foundational"
  parent_id = aws_organizations_organization.this.roots.0.id
}
locals {
  foundational_account_names = [
    "custodian",
    "iac",
    "audit",
  ]
}
resource "aws_organizations_account" "foundational_accounts" {
  count                      = length(local.foundational_account_names)
  name                       = element(local.foundational_account_names, count.index)
  email                      = replace(aws_organizations_organization.this.master_account_email, "/(.*)@gmail.com/", "$1+${element(local.foundational_account_names, count.index)}@gmail.com")
  iam_user_access_to_billing = "ALLOW"
  parent_id                  = aws_organizations_organizational_unit.foundational.id
  role_name                  = var.organization_account_access_role_name
}

################################################################################
# WorkLoad OU
################################################################################
resource "aws_organizations_organizational_unit" "workload" {
  name      = "Workload"
  parent_id = aws_organizations_organization.this.roots.0.id
}
