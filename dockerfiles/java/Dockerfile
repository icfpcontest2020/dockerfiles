FROM openjdk:11.0.7 AS build
WORKDIR /source

COPY . .
WORKDIR /source/app
RUN javac Main.java

FROM openjdk:11.0.7-jre
WORKDIR /build
COPY --from=build /source/app/Main.class .
ENTRYPOINT ["java", "Main"]
