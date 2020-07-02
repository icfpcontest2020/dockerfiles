FROM icfpcontest2020/rust:latest AS build
WORKDIR /source

COPY . .
RUN cargo build --release --offline

FROM debian:buster-20200607-slim
WORKDIR /target

COPY --from=build /source/target/release/app .
ENTRYPOINT ["./app"]