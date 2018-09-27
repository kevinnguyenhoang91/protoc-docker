FROM safetyculture/protoc
LABEL maintainer="SafetyCulture <info@safetyculture.io>"

ENV GRPC_RELEASE 1.14.2

# install dependencies and build/install grpc plugin
ADD . /src
RUN /src/build.sh
