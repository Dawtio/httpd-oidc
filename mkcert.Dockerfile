FROM alpine:3.15.4 AS build

WORKDIR /mkcert

RUN apk --no-cache add curl
RUN curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64" && \
  chmod +x mkcert-v1.4.4-linux-amd64

FROM alpine:3.15.4

COPY --from=build /mkcert/mkcert-v1.4.4-linux-amd64 /usr/local/bin/mkcert
WORKDIR /mkcert
CMD ["/usr/local/bin/mkcert"]
