FROM maven:3.5.3-jdk-8-alpine
RUN apk update
RUN apk add bluez
RUN apk add bluez-deprecated
COPY pom.xml .
RUN mvn -B dependency:resolve-plugins dependency:resolve clean package
ADD . /app
WORKDIR /app
RUN mvn -B clean package
CMD ["java", "-jar", "target/ruuvi-collector-0.2.jar"]
