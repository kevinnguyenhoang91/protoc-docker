FROM swift:4.2 as swift_builder

ENV GRPC_RELEASE=0.6.0

ADD . /src
RUN /src/build.sh


FROM safetyculture/protoc:1.1.0
LABEL maintainer="SafetyCulture <info@safetyculture.io>"

COPY --from=swift_builder /plugins /plugins
RUN ln -s /plugins/protoc-gen-swift /usr/bin/protoc-gen-swift
RUN ln -s /plugins/protoc-gen-swiftgrpc /usr/bin/protoc-gen-swiftgrpc
