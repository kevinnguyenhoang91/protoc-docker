FROM safetyculture/protoc
LABEL maintainer="SafetyCulture <info@safetyculture.io>"

ENV GOLANG_VERSION 1.14.3
ENV GOLANG_CHECKSUM 93023778d4d1797b7bc6a53e86c3a9b150c923953225f8a48a2d5fabc971af56
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
ENV S12_PROTO_VERSION 1.10.2

# install dependencies and build/install Go
ADD . /src
RUN /src/build.sh
