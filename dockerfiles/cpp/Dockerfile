FROM icfpcontest2020/cpp-build:latest AS build
WORKDIR /source

COPY . .
WORKDIR /source/app
RUN mkdir /build
RUN ./build

FROM icfpcontest2020/cpp-run:latest
WORKDIR /build
COPY --from=build /build .
ENTRYPOINT ["./run"]
