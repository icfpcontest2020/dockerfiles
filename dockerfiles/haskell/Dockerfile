FROM icfpcontest2020/haskell:latest AS build
WORKDIR /source

COPY . .
WORKDIR /source
RUN stack install --allow-different-user

FROM debian:buster-20200607-slim
WORKDIR /build
COPY --from=build /root/.local/bin/main .
ENTRYPOINT ["./main"]
