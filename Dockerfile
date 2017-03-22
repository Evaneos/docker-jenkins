FROM jenkins:2.32.3-alpine
MAINTAINER Régis Belson <me@regisbelson.fr>

USER root

RUN addgroup jenkins users

RUN set -ex \
    \
    && mkdir -p /tmp/download \
    && curl -L https://get.docker.com/builds/Linux/x86_64/docker-17.03.0-ce.tgz | tar -xz -C /tmp/download \
    && rm -rf /tmp/download/docker/dockerd \
    && mv /tmp/download/docker/docker* /usr/local/bin/ \
    && rm -rf /tmp/download

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.5.3/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

USER jenkins
