export DOCKER_PLANTUML_TAG=jetty

.PHONY: build
build:
	docker build ./ \
		--build-arg DOCKER_PLANTUML_TAG=${DOCKER_PLANTUML_TAG} \
		--tag my-plantuml:latest

.PHONY: puml
puml:
	docker run \
		--detach \
		--rm \
		--interactive \
		--tty \
		--name puml \
		--hostname puml \
		--publish 8080:8080 \
		my-plantuml:latest

.PHONY: clean
clean:
	docker container ls --quiet --filter "name=puml" | xargs -I {} docker stop {}
