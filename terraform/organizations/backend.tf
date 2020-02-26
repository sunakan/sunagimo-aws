terraform {
  #backend "s3" {
  #  bucket = "sunagimo-landing-zone-master"
  #  region = "ap-northeast-1"
  #  key    = "organizations.tfstate"
  #  shared_credentials_file = "~/.aws/credentials"
  #  encrypt = true
  #  profile = "iac"
  #}
  backend "local" {
    path = "./terraform.tfstate"
  }
}
