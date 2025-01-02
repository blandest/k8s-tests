#!/usr/bin/env bash


# Use minikube to build the image so that it is actually updated in minikube
go build . && \
    minikube image build -t in-cluster:latest .

# docker build --no-cache -t in-cluster:latest .