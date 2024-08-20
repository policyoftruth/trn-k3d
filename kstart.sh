#!/usr/bin/env bash

set -e

# change this value, if you need remote kubectl access
SERVER_IP="192.168.86.177"

# create image cache directory
IMAGE_CACHE=${HOME}/.k3d-container-image-cache
mkdir -p ${IMAGE_CACHE}

# create cluster
k3d cluster create \
  --k3s-arg "--tls-san=$SERVER_IP@server:0" \
  --volume /etc/machine-id:/etc/machine-id \
  --volume ${IMAGE_CACHE}:/var/lib/rancher/k3s/agent/containerd/io.containerd.content.v1.content \
  --k3s-arg "--disable=traefik@server:0" \
  --port 80:80@loadbalancer \
  --port 443:443@loadbalancer \
  --api-port 6443
