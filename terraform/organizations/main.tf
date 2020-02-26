locals {
  foundational_account_names = [
    "custodian",
    "iac",
    "audit",
  ]
}

provider "aws" {
  region                  = "ap-northeast-1"
  profile                 = "master"
  shared_credentials_file = "~/.aws/credentials"
}

#provider "aws" {
#  alias   = "iac"
#  region  = "ap-northeast-1"
#  profile = "iac"
#  shared_credentials_file = "~/.aws/credentials"
#  assume_role {
#    role_arn = "arn:aws:iam::${organization}:role/OrganizationAccountAccessRole"
#  }
#}

provider "aws" {
  alias                   = "custodian"
  region                  = "ap-northeast-1"
  profile                 = "custodian"
  shared_credentials_file = "~/.aws/credentials"
  assume_role {
    role_arn = "arn:aws:iam::xxxxxxxx:role/OrganizationAccountAccessRole"
  }
}
