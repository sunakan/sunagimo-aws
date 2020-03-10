export DOCKER_TERRAFORM_TAG = 0.12.23
export AWS_CONFIG_DIR = ${HOME}/.aws

ash:
	docker run \
      --interactive \
      --tty \
      --user `id -u`:`id -g` \
      --entrypoint "" \
      --workdir /terraform \
      --mount type=bind,source=${PWD}/terraform,target=/terraform \
      --mount type=bind,source=${AWS_CONFIG_DIR},target=/.aws \
      hashicorp/terraform:${DOCKER_TERRAFORM_TAG} \
      ash

v:
	docker run --tty hashicorp/terraform:${DOCKER_TERRAFORM_TAG} version
