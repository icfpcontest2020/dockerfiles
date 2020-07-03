FROM elixir:1.10.3-slim as Build

WORKDIR /source
COPY . .
WORKDIR /source/app/
RUN ./bin/build


FROM debian:buster-20200607-slim

ENV LANG=C.UTF-8
WORKDIR /app
COPY --from=Build /source/app/release ./
ENTRYPOINT ["./run"]