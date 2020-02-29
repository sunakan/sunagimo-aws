################################################################################
# Custodian
################################################################################
resource "aws_organizations_account" "custodian" {
  name                       = "custodian"
  email                      = replace(aws_organizations_organization.this.master_account_email, "/(.*)@gmail.com/", "$1+custodian@gmail.com")
  iam_user_access_to_billing = "ALLOW"
  parent_id                  = aws_organizations_organizational_unit.foundational.id
  role_name                  = var.organization_account_access_role_name

  lifecycle {
    ignore_changes = [
      iam_user_access_to_billing,
      role_name,
    ]
  }
}

################################################################################
# IaC
################################################################################
resource "aws_organizations_account" "iac" {
  name                       = "iac"
  email                      = replace(aws_organizations_organization.this.master_account_email, "/(.*)@gmail.com/", "$1+iac@gmail.com")
  iam_user_access_to_billing = "ALLOW"
  parent_id                  = aws_organizations_organizational_unit.foundational.id
  role_name                  = var.organization_account_access_role_name

  lifecycle {
    ignore_changes = [
      iam_user_access_to_billing,
      role_name,
    ]
  }
}

################################################################################
# Audit
################################################################################
resource "aws_organizations_account" "audit" {
  name                       = "audit"
  email                      = replace(aws_organizations_organization.this.master_account_email, "/(.*)@gmail.com/", "$1+audit@gmail.com")
  iam_user_access_to_billing = "ALLOW"
  parent_id                  = aws_organizations_organizational_unit.foundational.id
  role_name                  = var.organization_account_access_role_name

  lifecycle {
    ignore_changes = [
      iam_user_access_to_billing,
      role_name,
    ]
  }
}
