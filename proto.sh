#!/bin/bash
set -e

for d in protobuf/* ; do
    service="$(basename -- $d .proto)"
    echo "${service} ==>  ${d}"
    mkdir -p genproto/${service}
    protoc \
    --proto_path=protobuf "protobuf/$service.proto" \
    "--go_out=genproto/$service" --go_opt=paths=source_relative \
    --go-grpc_opt=require_unimplemented_servers=false \
    "--go-grpc_out=genproto/$service" --go-grpc_opt=paths=source_relative
        # PHP
    mkdir -p php

    # Generate PHP only for shared contracts
    if [[ "$service" == shared_* ]]; then
        echo "Generating PHP for $service"

        protoc \
            --proto_path=protobuf \
            "$d" \
            --php_out=php
    fi
done

