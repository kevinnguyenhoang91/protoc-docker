#!/bin/bash

set -e

TARGET_DIR="pb-node"

pf=(`find . -maxdepth 1 -name "*.proto"`)
if [ ${#pf[@]} -eq 0 ]; then
  echo "No proto files found!"
  exit 1
fi

echo "Found Proto definitions:"
printf "\t+%s\n" "${pf[@]}"

echo

if [ ! -d "$TARGET_DIR" ]; then
  mkdir $TARGET_DIR
fi

echo "Building Node source..."
protoc -I . ${pf[@]} --grpc_out=./$TARGET_DIR --plugin=protoc-gen-grpc=$(which grpc_node_plugin) --js_out=import_style=commonjs,binary:./$TARGET_DIR --ts_out=service=false:./$TARGET_DIR --plugin=protoc-gen-ts=$(which protoc-gen-ts)
echo "Done!"
