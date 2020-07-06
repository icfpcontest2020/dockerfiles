FROM golang:1.14.4

WORKDIR /solution
COPY . .
RUN ./build.sh
ENTRYPOINT ["./run.sh"]
