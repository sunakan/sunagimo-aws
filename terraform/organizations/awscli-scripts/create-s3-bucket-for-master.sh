#!/bin/bash

################################################################################
# AWS マルチアカウント構築に使うterraformのtfstateの管理するためのs3バケット構築
# 前提
# Iac用のアカウントを作成済み or これだけはマスターアカウントに置くのもありかも
# もしマスターアカウントに作りたければProfileを変更する
################################################################################

set -eu

readonly AWS_ACCOUNT_PROFILE="iac"

aws --profile ${AWS_ACCOUNT_PROFILE} \
  sts get-caller-identity

readonly S3_BUCKET_NAME="sunagimo-landing-zone-master"
readonly S3_BUCKET_REGION="ap-northeast-1"

aws --profile ${AWS_ACCOUNT_PROFILE} \
  s3api create-bucket \
  --bucket ${S3_BUCKET_NAME} \
  --create-bucket-configuration "LocationConstraint=${S3_BUCKET_REGION}"

aws --profile ${AWS_ACCOUNT_PROFILE} \
  s3api put-bucket-encryption \
  --bucket ${S3_BUCKET_NAME} \
  --server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}'

aws --profile ${AWS_ACCOUNT_PROFILE} \
  s3api put-public-access-block \
  --bucket ${S3_BUCKET_NAME} \
  --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

aws --profile ${AWS_ACCOUNT_PROFILE} \
  s3api put-bucket-versioning \
  --bucket ${S3_BUCKET_NAME} \
  --versioning-configuration "Status=Enabled"
