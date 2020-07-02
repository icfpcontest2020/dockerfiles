FROM zenika/kotlin:1.3.72-slim AS build
WORKDIR /source

COPY . .
WORKDIR /source/app
RUN kotlinc *.kt -include-runtime -d Main.jar

FROM openjdk:11.0.7-jre
WORKDIR /build
COPY --from=build /source/app/Main.jar .
ENTRYPOINT ["java", "-jar", "Main.jar"]