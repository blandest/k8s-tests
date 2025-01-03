#!/usr/bin/env bash

set -e
set -o pipefail

# These seem unneeded
# kubectl delete deployment deployment
# kubectl apply -f deployment.yaml \

# Ensure the image is rebuilt and loaded
bin/build-image.sh && \
    kubectl scale deployment deployment --replicas 0 && \
    kubectl scale deployment deployment --replicas 1

kubectl wait --for=condition=Ready --all pods
pod=$(kubectl get pods | grep Running | cut -d' ' -f1)

kubectl logs -f $pod
