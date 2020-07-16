FROM php:7.4-cli

WORKDIR /solution
COPY . .
RUN chmod +x ./build.sh
RUN chmod +x ./run.sh
RUN ./build.sh
ENTRYPOINT ["./run.sh"]