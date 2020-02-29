variable "organization_account_access_role_name" {
  description = "Organizationsでメンバーアカウントを作成した時、自動生成されるRole名（マスターアカウントからなら誰からでもなれる）"
  type        = string
  default     = "OrganizationAccountAccessRole"
}
