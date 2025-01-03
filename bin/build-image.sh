#!/usr/bin/env bash

set -o pipefail
set -e

# Use minikube to build the image so that it is actually updated in minikube
go build . && \
    minikube image build -t in-cluster:latest . && \
    minikube image load in-cluster:latest --pull
