#FROM golang:1.9
FROM golang:1.11.2-alpine

RUN apk update && apk upgrade
RUN apk add vim

#RUN apk add rc-update
#RUN echo "http://dl-6.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
#RUN apk update
#RUN apk add docker

ARG DOCKER_CLI_VERSION="17.06.2-ce"
ENV DOWNLOAD_URL="https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_CLI_VERSION.tgz"

# install docker client
RUN apk --update add curl \
    && mkdir -p /tmp/download \
    && curl -L $DOWNLOAD_URL | tar -xz -C /tmp/download \
    && mv /tmp/download/docker/docker /usr/local/bin/ \
    && rm -rf /tmp/download \
    && apk del curl \
    && rm -rf /var/cache/apk/*



RUN apk add --no-cache git
RUN go get -u github.com/P3GLEG/Whaler

WORKDIR $GOPATH/src/github.com/P3GLEG/Whaler

RUN go build .
CMD ./Whaler
