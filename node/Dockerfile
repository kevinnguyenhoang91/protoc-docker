FROM safetyculture/protoc
LABEL maintainer="SafetyCulture <info@safetyculture.io>"

ENV NODE_VERSION 8.8.1
ENV GRPC_RELEASE 1.7.0

# install dependencies and build/install Go
ADD . /src
RUN /src/build.sh

COPY script.sh /opt/safetyculture/script.sh
ENTRYPOINT ["/opt/safetyculture/script.sh"]
