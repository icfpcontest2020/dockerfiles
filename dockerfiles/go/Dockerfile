FROM golang:1.14 AS build
WORKDIR /source

COPY . .
RUN go build -o app .

FROM debian:buster-20200607-slim
WORKDIR /build
COPY --from=build /source/app .
ENTRYPOINT ["./app"]
