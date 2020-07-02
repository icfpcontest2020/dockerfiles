FROM openjdk:11.0.7 AS build
WORKDIR /source

COPY . .
WORKDIR /source/app
RUN javac -d build *.java
WORKDIR build
RUN jar cfe Main.jar Main *

FROM openjdk:11.0.7-jre
WORKDIR /build
COPY --from=build /source/app/build/Main.jar .
ENTRYPOINT ["java", "-jar", "Main.jar"]
