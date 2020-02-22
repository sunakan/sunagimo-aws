export DOCKER_TERRAFORM_TAG = 0.12.21

ash:
	docker run \
      --interactive \
      --tty \
      --user `id -u`:`id -g` \
      --entrypoint "" \
      --workdir /terraform \
      --mount type=bind,source=${PWD}/terraform,target=/terraform \
      hashicorp/terraform:${DOCKER_TERRAFORM_TAG} \
      ash

v:
	docker run --tty hashicorp/terraform:${DOCKER_TERRAFORM_TAG} version
