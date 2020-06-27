FROM gcc:10.1.0 AS build
WORKDIR /source

COPY . .
WORKDIR /source/app
RUN g++ -o main main.cpp

FROM debian:buster-20200607-slim
WORKDIR /build
COPY --from=build /source/app/main .
ENTRYPOINT ["./main"]
