#!/usr/bin/env bash

set -e

# change this value, if you need remote kubectl access
mainIP=`hostname -I | awk '{ print $1 }'`

# create cluster
k3d cluster create my-cluster \
  --api-port ${mainIP}:6443 \
  --k3s-arg "--disable=traefik@server:0"
