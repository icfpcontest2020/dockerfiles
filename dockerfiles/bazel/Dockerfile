FROM icfpcontest2020/bazel:latest AS build
WORKDIR /source

COPY . .
RUN bazel --batch build --distdir=/bazel/dist -c opt //app:app

FROM debian:buster-20200607-slim
WORKDIR /build
COPY --from=build /source/bazel-bin/app/app .
ENTRYPOINT ["./app"]
