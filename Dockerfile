#syntax=docker/dockerfile:experimental

### Maven build stage
FROM maven:3.6-adoptopenjdk-8 as maven_build
WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN --mount=type=cache,target=/root/.m2 mvn clean package
RUN mkdir -p target/docker && cd target/docker && cp ../ruuvi-collector-*.jar .

### JRE run stage
FROM adoptopenjdk:8-jre
WORKDIR /app

RUN apt-get update && apt-get install -y bluez bluez-hcidump

COPY --from=maven_build /app/target/docker/ruuvi-collector-*.jar /app/

CMD java -jar ruuvi-collector-0.2.jar
