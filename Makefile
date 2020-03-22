export DOCKER_TERRAFORM_TAG = 0.12.23
export AWS_CONFIG_DIR_ABSOLUTE_PATH = ${PWD}/aws-config-files

aws-config-files:
	mkdir -p ${AWS_CONFIG_DIR_ABSOLUTE_PATH}

.PHONY: ash
ash: aws-config-files
	docker run \
      --interactive \
      --tty \
      --user `id -u`:`id -g` \
      --entrypoint "" \
      --workdir /terraform \
      --mount type=bind,source=${PWD}/terraform,target=/terraform \
      --mount type=bind,source=${AWS_CONFIG_DIR_ABSOLUTE_PATH},target=/.aws \
      hashicorp/terraform:${DOCKER_TERRAFORM_TAG} \
      ash

.PHONY: v
v:
	docker run --tty hashicorp/terraform:${DOCKER_TERRAFORM_TAG} version

.PHONY: puml
puml:
	cd plantuml-server && make puml
