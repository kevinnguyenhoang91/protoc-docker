FROM swift:5.7.1 as swift_builder

ENV GRPC_RELEASE=1.13.0

ADD . /src
RUN /src/build.sh

FROM ghcr.io/safetyculture/protoc:1.12.0
LABEL maintainer="Kha Nguyen <kevinnguyenhoang91@gmail.com>"

COPY --from=swift_builder /plugins /plugins
COPY --from=swift_builder /usr/include/google /google
RUN ln -s /plugins/protoc-gen-swift /usr/bin/protoc-gen-swift
RUN ln -s /plugins/protoc-gen-grpc-swift /usr/bin/protoc-gen-grpc-swift
