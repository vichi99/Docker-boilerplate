#!/bin/bash
args=("$@")
node_version=${args[0]} 
command=${args[@]:1}

docker run \
  -it \
  --rm \
  --name local-nodejs-version-${node_version}-bin \
  --user $(id -u):$(id -g) \
  -v $PWD:/usr/src/app:delegated \
  -w /usr/src/app \
  --network="host" \
  node:${node_version} ${command}
