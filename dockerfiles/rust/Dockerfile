FROM rust:slim-stretch AS build
WORKDIR /source

COPY . .
WORKDIR /source/app
RUN rustc -O main.rs

FROM debian:buster-20200607-slim
WORKDIR /build
COPY --from=build /source/app/main .
ENTRYPOINT ["./main"]