FROM alpine:3.6
LABEL maintainer="SafetyCulture <info@safetyculture.io>"

ENV PROTOC_VERSION 3.4.1

# install dependencies and build/install protoc
ADD . /src
RUN /src/build.sh

# Setup directories for the volumes that should be used
WORKDIR /defs
