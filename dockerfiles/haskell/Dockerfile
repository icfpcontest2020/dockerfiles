FROM haskell:8.10.1 AS build
WORKDIR /source

COPY . .
WORKDIR /source/app
RUN ghc Main.hs

FROM debian:buster-20200607-slim
WORKDIR /build
COPY --from=build /source/app/Main .
ENTRYPOINT ["./Main"]
