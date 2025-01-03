FROM debian
COPY ./k8s /app
CMD ["/app", "test1", "test2"]
