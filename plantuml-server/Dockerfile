ARG DOCKER_PLANTUML_TAG
FROM plantuml/plantuml-server:${DOCKER_PLANTUML_TAG}


USER root
RUN apt update --quiet \
  && apt install --yes \
    fonts-roboto \
    fonts-noto \
    fonts-ricty-diminished

USER jetty
