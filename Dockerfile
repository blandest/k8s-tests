FROM debian
COPY ./k8s /app
ENTRYPOINT /app
