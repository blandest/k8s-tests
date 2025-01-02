#!/usr/bin/env bash


# These seem unneeded
# kubectl delete deployment deployment
# kubectl apply -f deployment.yaml \

# Ensure the image is rebuilt and loaded
bin/build-image.sh && \
    kubectl scale deployment deployment --replicas 0 && \
    kubectl scale deployment deployment --replicas 1

while
    sleep 1
    pod=$(kubectl get pods | grep Running | cut -d' ' -f1)
    # Wait for the pod to start up
    [[$? -eq 0]]
do true; done

kubectl logs -f $pod
