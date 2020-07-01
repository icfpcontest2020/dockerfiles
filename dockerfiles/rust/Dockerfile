FROM rust:1.44.1-buster AS build
WORKDIR /source

COPY . .
WORKDIR /source/app
RUN cargo build --release

FROM debian:buster-20200607-slim
WORKDIR /target
COPY --from=build /source/target/release/app .
ENTRYPOINT ["./app"]