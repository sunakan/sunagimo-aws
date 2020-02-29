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

################################################################################
# WorkLoad OU
################################################################################
resource "aws_organizations_organizational_unit" "workload" {
  name      = "Workload"
  parent_id = aws_organizations_organization.this.roots.0.id
}
