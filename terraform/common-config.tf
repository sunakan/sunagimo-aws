terraform {
  required_version = "0.12.21"
}

provider "null" {}

provider "aws" {
  region  = "ap-northeast-1"
}
