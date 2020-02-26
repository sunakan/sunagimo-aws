################################################################################
# Organization
################################################################################
#output "all" {
#  value = aws_organizations_organization.this.accounts.*.id
#}

################################################################################
# プロビジョニング用ロールにスイッチするための踏み台ロール
################################################################################
#data "aws_iam_policy_document" "provisioning_bastion_assume_role_policy" {
#  statement {
#    actions = ["sts:AssumeRole"]
#    principals {
#      type        = "Service"
#      identifiers = ["ec2.amazonaws.com"]
#    }
#  }
#}
#resource "aws_iam_role" "provisioning_bastion" {
#  provider           = aws.custodian
#  name               = "sunagimo-provisioning-bastion"
#  assume_role_policy = data.aws_iam_policy_document.provisioning_bastion_assume_role_policy.json
#}