FROM gcc:10.1.0 AS build
WORKDIR /source

COPY . .
WORKDIR /source/app
RUN mkdir /build
RUN ./build

FROM debian:buster-20200607-slim
WORKDIR /build
COPY --from=build /build .
ENTRYPOINT ["./run"]
